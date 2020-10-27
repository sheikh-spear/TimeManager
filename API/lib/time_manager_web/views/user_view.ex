defmodule TimeManagerWeb.UserView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("working_times.json", %{workingtimes: workingtimes}) do
    %{data: render_many(workingtimes, UserView, "working_time.json")}
  end
  
  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      email: user.email,
      is_manager: user.is_manager,
      is_general_manager: user.is_general_manager,
      manager: user.manager
    }
  end

	def render("sign_in.json", %{user: user}) do
		%{
			data: %{
				user: %{
					id: user.id,
					email: user.email,
          is_manager: user.is_manager,
          is_general_manager: user.is_general_manager
				}
			}
		}
  end

  def render("working_time.json", %{user: workingtime}) do
    %{
        start: workingtime.start,
        end: workingtime.end
    }
  end

  def render("error.json", %{user: message}) do
    %{
      error: message
    }
  end
end
