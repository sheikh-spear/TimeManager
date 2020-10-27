defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

	pipeline :api_auth do
		plug :ensure_autheticated
	end

  scope "/api", TimeManagerWeb do
    pipe_through :api
    post "/users/sign_in", UserController, :sign_in
    post "/users/find_user_with_email", UserController, :find_user_with_email
    post "/users/register", UserController, :create
  end

	scope "/api", TimeManagerWeb do
    pipe_through [:api, :api_auth]
    get "/users/punch_clock", UserController, :punch_clock
    get "/users/working_times", UserController, :get_working_time
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
