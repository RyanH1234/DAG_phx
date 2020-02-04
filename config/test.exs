use Mix.Config

# Configure your database
config :dag_phx, DagPhx.Repo,
  username: "postgres",
  password: "postgres",
  database: "dag_phx_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dag_phx, DagPhxWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
