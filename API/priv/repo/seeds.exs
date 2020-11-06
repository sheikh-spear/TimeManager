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

TimeManager.Account.create_user(%{email: "user1@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user2@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user3@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user3@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user4@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user5@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user6@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user7@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user8@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user9@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user10@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user11@email.com", password: "user"})
TimeManager.Account.create_user(%{email: "user12@email.com", password: "user"})

TimeManager.Account.create_user(%{email: "manager@email.com", password: "manager", is_manager: true})
TimeManager.Account.create_user(%{email: "general.manager@email.com", password: "general.manager", is_manager: true, is_general_manager: true})

# TimeManager.ClockPointer.create_clock(%{start: ~N[2010-04-17 14:00:00], status: false, user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
# TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 14:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 17:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 08:00:00], end: ~N[2010-04-17 12:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 14:00:00], end: ~N[2010-04-18 17:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 08:00:00], end: ~N[2010-04-18 12:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 08:00:00], end: ~N[2010-04-19 12:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 14:00:00], end: ~N[2010-04-19 17:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 08:00:00], end: ~N[2010-04-20 12:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 14:00:00], end: ~N[2010-04-20 17:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 08:00:00], end: ~N[2010-04-21 12:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 14:00:00], end: ~N[2010-04-21 17:00:00], user: TimeManager.Account.get_user_id_using_email("user1@email.com")})

TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 17:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 08:00:00], end: ~N[2010-04-17 12:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 14:00:00], end: ~N[2010-04-18 17:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 08:00:00], end: ~N[2010-04-18 12:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 08:00:00], end: ~N[2010-04-19 12:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 14:00:00], end: ~N[2010-04-19 17:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 08:00:00], end: ~N[2010-04-20 12:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 14:00:00], end: ~N[2010-04-20 17:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 08:00:00], end: ~N[2010-04-21 12:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 14:00:00], end: ~N[2010-04-21 17:00:00], user: TimeManager.Account.get_user_id_using_email("user2@email.com")})

TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 17:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 08:00:00], end: ~N[2010-04-17 12:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 14:00:00], end: ~N[2010-04-18 17:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 08:00:00], end: ~N[2010-04-18 12:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 08:00:00], end: ~N[2010-04-19 12:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 14:00:00], end: ~N[2010-04-19 17:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 08:00:00], end: ~N[2010-04-20 12:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 14:00:00], end: ~N[2010-04-20 17:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 08:00:00], end: ~N[2010-04-21 12:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 14:00:00], end: ~N[2010-04-21 17:00:00], user: TimeManager.Account.get_user_id_using_email("user3@email.com")})

TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 17:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 08:00:00], end: ~N[2010-04-17 12:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 14:00:00], end: ~N[2010-04-18 17:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 08:00:00], end: ~N[2010-04-18 12:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 08:00:00], end: ~N[2010-04-19 12:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 14:00:00], end: ~N[2010-04-19 17:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 08:00:00], end: ~N[2010-04-20 12:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 14:00:00], end: ~N[2010-04-20 17:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 08:00:00], end: ~N[2010-04-21 12:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 14:00:00], end: ~N[2010-04-21 17:00:00], user: TimeManager.Account.get_user_id_using_email("user4@email.com")})

TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 17:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 08:00:00], end: ~N[2010-04-17 12:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 14:00:00], end: ~N[2010-04-18 17:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 08:00:00], end: ~N[2010-04-18 12:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 08:00:00], end: ~N[2010-04-19 12:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 14:00:00], end: ~N[2010-04-19 17:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 08:00:00], end: ~N[2010-04-20 12:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 14:00:00], end: ~N[2010-04-20 17:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 08:00:00], end: ~N[2010-04-21 12:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 14:00:00], end: ~N[2010-04-21 17:00:00], user: TimeManager.Account.get_user_id_using_email("user5@email.com")})

TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 17:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 08:00:00], end: ~N[2010-04-17 12:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 14:00:00], end: ~N[2010-04-18 17:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 08:00:00], end: ~N[2010-04-18 12:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 08:00:00], end: ~N[2010-04-19 12:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 14:00:00], end: ~N[2010-04-19 17:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 08:00:00], end: ~N[2010-04-20 12:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 14:00:00], end: ~N[2010-04-20 17:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 08:00:00], end: ~N[2010-04-21 12:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 14:00:00], end: ~N[2010-04-21 17:00:00], user: TimeManager.Account.get_user_id_using_email("manager@email.com")})

TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 14:00:00], end: ~N[2010-04-17 17:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-17 08:00:00], end: ~N[2010-04-17 12:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 14:00:00], end: ~N[2010-04-18 17:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-18 08:00:00], end: ~N[2010-04-18 12:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 08:00:00], end: ~N[2010-04-19 12:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-19 14:00:00], end: ~N[2010-04-19 17:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 08:00:00], end: ~N[2010-04-20 12:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-20 14:00:00], end: ~N[2010-04-20 17:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 08:00:00], end: ~N[2010-04-21 12:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})
TimeManager.WorkingTimeTracker.create_working_time(%{start: ~N[2010-04-21 14:00:00], end: ~N[2010-04-21 17:00:00], user: TimeManager.Account.get_user_id_using_email("general.manager@email.com")})



