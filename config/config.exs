# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dag_phx,
  ecto_repos: [DagPhx.Repo]

# Configures the endpoint
config :dag_phx, DagPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5dzSimcqqsZDY6EK5Zs7iS9AopwZ4gJBKQjR4odg7rbOiToHAhpK/XsVkDyb5SLN",
  render_errors: [view: DagPhxWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: DagPhx.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
