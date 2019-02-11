use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vystoria, VystoriaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# speed up
config :bcrypt_elixir, :log_rounds, 4

# Configure your database
config :vystoria, Vystoria.Repo,
  username: System.get_env("POSTGRES_USER") || "vystoria",
  password: System.get_env("POSTGRES_PASSWORD") || "vystoria",
  database: System.get_env("POSTGRES_DB") || "vystoria_test",
  hostname: System.get_env("POSTGRES_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
