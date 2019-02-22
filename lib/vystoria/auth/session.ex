defmodule Vystoria.Auth.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :revoked, :boolean, default: false, null: false
    field :revoked_at, :utc_datetime
    field :token, :string, null: false

    belongs_to :user, Vystoria.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:token, :revoked, :revoked_at])
    |> validate_required([:token])
    |> unique_constraint(:token)
  end
end
