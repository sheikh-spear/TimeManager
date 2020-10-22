# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :time_manager,
  ecto_repos: [TimeManager.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :time_manager, TimeManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Gvf7ywkUAU6DKQV1RvQVUY3tTwpQ2QEmgmfcc+6/DEEAJ84moiQbPqh5qNlIh9SK",
  render_errors: [view: TimeManagerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TimeManager.PubSub,
  live_view: [signing_salt: "qK4fHRyb"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
