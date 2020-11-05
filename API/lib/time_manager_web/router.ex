defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug CORSPlug, origin: "*"
  end

	pipeline :api_auth do
		plug :ensure_autheticated
  end
  
  pipeline :api_manager do
    plug :ensure_manager
  end

  pipeline :api_general_manager do
    plug :ensure_general_manager
  end

  scope "/api", TimeManagerWeb do
    pipe_through [:api, :api_general_manager]
    post "/general_manager/delete_user_account", UserController, :delete_user_account
    post "/general_manager/promote", UserController, :promote
    post "/general_manager/demote", UserController, :demote
    post "/general_manager/get_user_working_time", UserController, :get_user_working_time
  end

  scope "/api", TimeManagerWeb do
    pipe_through [:api, :api_manager]
    post "/manager/add_user_to_team", UserController, :add_user_to_team
    post "/manager/remove_user_from_team", UserController, :remove_user_from_team
    get  "/manager/list_users_from_team", UserController, :list_users_from_team
    post "/manager/get_team_member_working_time", UserController, :get_team_member_working_time
    get "/manager/list_users", UserController, :index
  end

  scope "/api", TimeManagerWeb do
    pipe_through :api
    post "/users/sign_in", UserController, :sign_in
    post "/users/find_user_with_email", UserController, :find_user_with_email
    post "/users/register", UserController, :create
    get "/users/profile", UserController, :profile
  end

	scope "/api", TimeManagerWeb do
    pipe_through [:api, :api_auth]
    get "/users/punch_clock", UserController, :punch_clock
    get "/users/working_times", UserController, :get_working_time
    post "/users/delete_account", UserController, :delete_account
    resources "/users", UserController, except: [:new, :edit]
	end

  # Enables LiveDashboard only for developmentmi
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router
    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TimeManagerWeb.Telemetry
    end
  end


  defp ensure_manager(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)
    if current_user_id != nil and current_user_id != "" and TimeManager.Account.get_user!(current_user_id).is_manager == true do
      conn
    else
      conn
			|> put_status(:unauthorized)
			|> put_view(TimeManagerWeb.ErrorView)
			|> render("401.json", message: "Unauthenticated user")
			|> halt()
    end
  end


  defp ensure_general_manager(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)
    if current_user_id != nil and current_user_id != "" and TimeManager.Account.get_user!(current_user_id).is_general_manager == true do
      conn
    else
      conn
			|> put_status(:unauthorized)
			|> put_view(TimeManagerWeb.ErrorView)
			|> render("401.json", message: "Unauthenticated user")
			|> halt()
    end
  end

	defp ensure_autheticated(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)
		if current_user_id do
			conn
		else
			conn
			|> put_status(:unauthorized)
			|> put_view(TimeManagerWeb.ErrorView)
			|> render("401.json", message: "Unauthenticated user")
			|> halt()
		end
	end
end
