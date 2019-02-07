defmodule Vystoria.Repo do
  use Ecto.Repo,
    otp_app: :vystoria,
    adapter: Ecto.Adapters.Postgres
end
