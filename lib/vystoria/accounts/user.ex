defmodule Vystoria.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:is_active, :boolean, default: false)
    field(:is_push_notifications_activated, :boolean, default: true)
    field(:is_email_notifications_activated, :boolean, default: true)
    field(:email, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)


    has_many(:sessions, Vystoria.Auth.Session)
    has_many(:photos, Vystoria.Images.Photo)
    has_many(:inspections, Vystoria.Inspections.Inspection)

    timestamps()
  end

  @required [:first_name, :last_name, :email]
  @optional [:is_push_notifications_activated, :is_email_notifications_activated]

  @doc false
  def register_changeset(user, attrs) do
    user
    |> cast(attrs, @required ++ @optional ++ [:password])
    |> validate_required(@required)
    |> validate_length(:password, min: 8, max: 100)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required ++ @optional ++ [:is_active])
    |> validate_required(@required)
    |> validate_length(:password, min: 8, max: 100)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end
end
