defmodule TimeManagerWeb.UserController do
  use TimeManagerWeb, :controller

  alias TimeManager.Account
  alias TimeManager.Account.User
  alias TimeManager.Repo
  import Ecto.Query

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    users = Account.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Account.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def profile(conn, params) do
    render(conn, "show.json", user: Account.get_user!(conn.private.plug_session["current_user_id"]))
  end
  
  def show(conn, %{"id" => id}) do
    user = Account.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Account.get_user!(id)

    with {:ok, %User{} = user} <- Account.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def promote(conn, params) do
    user = Repo.get_by(User, email: params["email"])
    if user == nil do
      render(conn, "error.json", user: "User does not exist")
    end
    if user.is_manager == true do
      render(conn, "error.json", user: "User is already a manager")
    end
    Account.update_user(user, %{is_manager: true})
    render(conn, "show.json", user: Repo.get_by(User, email: params["email"]));
  end

  def demote(conn, params) do
    user = Repo.get_by(User, email: params["email"])
    if user == nil do
      render(conn, "error.json", user: "User does not exist")
    end
    if user.is_manager == false do
      render(conn, "error.json", user: "User is not a manager")
    end
    Account.update_user(user, %{is_manager: false})
    render(conn, "show.json", user: Repo.get_by(User, email: params["email"]));
  end

  def get_user_working_time(conn, params) do
    user = Repo.get_by(User, email: params["email"])
    if user == nil do
      render(conn, "error.json", user: "User does not exist")
    end
    fetch_working_time(conn, user.id)
  end

  def get_team_member_working_time(conn, params) do
    user = Repo.get_by(User, email: params["email"])
    if user == nil or user.manager != conn.private.plug_session["current_user_id"] do
      render(conn, "error.json", user: "User is not in your team")
    end
    fetch_working_time(conn, user.id)
  end

  def get_working_time(conn, params) do
    fetch_working_time(conn, conn.private.plug_session["current_user_id"])
  end

  def fetch_working_time(conn, id) do
    query = Ecto.Query.from(TimeManager.WorkingTimeTracker.WorkingTime, where: [user: ^id], select: [:start, :end])
    workingtimes = Repo.all(query)
    render(conn, "working_times.json", workingtimes: workingtimes)
  end


  def add_user_to_team(conn, params) do
    user = Repo.get_by(User, email: params["email"])
    team = nil
    if user.manager != nil do
      Account.update_user(user, %{manager: user.manager ++ [conn.private.plug_session["current_user_id"]]})
    else
      Account.update_user(user, %{manager: [conn.private.plug_session["current_user_id"]]})
    end
    render(conn, "show.json", user: Repo.get_by(User, email: params["email"]));
  end

  def remove_user_from_team(conn, params) do
    user = Repo.get_by(User, email: params["email"])
    Account.update_user(user, %{manager: user.manager -- [conn.private.plug_session["current_user_id"]]})
    render(conn, "show.json", user: Repo.get_by(User, email: params["email"]));
  end

  def list_users_from_team(conn, params) do
    id = conn.private.plug_session["current_user_id"]
    query = Ecto.Query.from(u in User, where: ^id in u.manager)
    #query = from(User, where: [manager: ^id], select: [:email, :is_manager, :is_general_manager])
    users = Repo.all(query)
    render(conn, "index.json", users: users)
  end

  def punch_clock(conn, params) do
    id = conn.private.plug_session["current_user_id"]
    user = Account.get_user!(id)
    if user.status == true do
      TimeManager.WorkingTimeTracker.create_working_time(%{start: user.start, end: NaiveDateTime.utc_now, user: id})
      Account.update_user(user, %{status: false, start: nil})
    end
    if user.status == false do
      Account.update_user(user, %{status: true, start: DateTime.utc_now})
    end
    render(conn, "show.json", user: Account.get_user!(id))
  end

  def find_user_with_email(conn, %{"email" => email}) do
    query = Repo.get_by(User, email: email)
    render(conn, "show.json", user: query);
  end

  def delete_account(conn, params) do
    delete(conn, conn.private.plug_session["current_user_id"])
  end

  def delete_user_account(conn, params) do
    user = Repo.get_by(User, email: params["email"])
    delete(conn, user.id)
  end
  
  def delete(conn, id) do
    user = Account.get_user!(id)

    with {:ok, %User{}} <- Account.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

	def sign_in(conn, %{"email" => email, "password" => password}) do
		case TimeManager.Account.authenticate_user(email, password) do
			{:ok, user} ->
				conn
				|> put_session(:current_user_id, user.id)
				|> configure_session(renew: true)
				|> put_status(:ok)
				|> put_view(TimeManagerWeb.UserView)
				|> render("sign_in.json", user: user)

			{:error, message} ->
				conn
				|> delete_session(:current_user_id)
				|> put_status(:unauthorized)
				|> put_view(TimeManagerWeb.ErrorView)
				|> render("401.json", message: message)
			end
		end

end
