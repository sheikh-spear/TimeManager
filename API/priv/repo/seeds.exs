# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimeManager.Repo.insert!(%TimeManager.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
IO.puts("Adding a couple of users...")

TimeManager.Account.create_user(%{email: "user1@email.com", password: "user1"})
TimeManager.Account.create_user(%{email: "user2@email.com", password: "user2"})
TimeManager.Account.create_user(%{email: "user3@email.com", password: "user3"})
TimeManager.Account.create_user(%{email: "manager@email.com", password: "manager", is_manager: true})
TimeManager.Account.create_user(%{email: "general.manager@email.com", password: "general.manager", is_manager: true, is_general_manager: true})
# TimeManager.ClockPointer.create_clock(%{start: ~N[2010-04-17 14:00:00], status: false, user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
# TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 14:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})