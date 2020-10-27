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

  def get_working_time(conn, params) do
    id = conn.private.plug_session["current_user_id"]
    query = Ecto.Query.from(TimeManager.WorkingTimeTracker.WorkingTime, where: [user: ^id], select: [:start, :end])
    workingtimes = Repo.all(query)
    render(conn, "working_times.json", workingtimes: workingtimes)
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
    render(conn, "show.json", user: user)
  end

  def find_user_with_email(conn, %{"email" => email}) do
    query = Repo.get_by(User, email: email)
    render(conn, "show.json", user: query);
  end

  def delete(conn, %{"id" => id}) do
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
