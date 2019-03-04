defmodule Vystoria.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # timber conffigurations
    :ok = Logger.add_translator({Timber.Exceptions.Translator, :translate})
    :ok = :telemetry.attach(
      "timber-ecto-query-handler",
      [:my_app, :repo, :query],
      &Timber.Ecto.handle_event/4,
      []
    )
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Vystoria.Repo,
      # Start the endpoint when the application starts
      VystoriaWeb.Endpoint
      # Starts a worker by calling: Vystoria.Worker.start_link(arg)
      # {Vystoria.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Vystoria.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    VystoriaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
