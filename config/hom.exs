use Mix.Config

config :vystoria, VystoriaWeb.Endpoint,
  http: [port: System.get_env("PHOENIX_PORT")],
  url: [port: System.get_env("PHOENIX_PORT")],
  server: true,
  root: ".",
  version: Mix.Project.config()[:version]

config :vystoria,
  ecto_repos: [Vystoria.Repo],
  log: false

config :logger,
  backends: [Timber.LoggerBackends.HTTP],
  level: :info

config :timber,
  api_key: System.get_env("TIMBER_API_KEY"),
  ec2_context: true

# Configure your database
config :vystoria, Vystoria.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("POSTGRES_URL"),
  pool_size: 15

config :vystoria, VystoriaWeb.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")
