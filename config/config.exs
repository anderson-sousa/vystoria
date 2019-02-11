# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vystoria,
  ecto_repos: [Vystoria.Repo]

# Configures the endpoint
config :vystoria, VystoriaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hN+wo4Soq6tS0vVR/0cBmF3s9Corlz1houb3O2Pm5Nbt1MDxeTs3gYG7PaRgJ3/o",
  render_errors: [view: VystoriaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Vystoria.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Mailer
config :vystoria, Vystoria.Mailer, adapter: Bamboo.SMTPAdapter

# Configure mailing
config :vystoria, Vystoria.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: System.get_env("SES_SERVER") || "email-smtp.us-east-1.amazonaws.com",
  port: System.get_env("SES_PORT") || 587,
  username: System.get_env("SMTP_USERNAME") || "AKIAIWXT4Z3MR7XITWFQ",
  password: System.get_env("SMTP_PASSWORD") || "BFM19ed4LkCVs9jIVxcHMgTVZTz8Tigy87irJ1owDQ00",
  # can be `:always` or `:never`
  tls: :always,
  # can be `true`
  ssl: false,
  retries: 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
