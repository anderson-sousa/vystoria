defmodule Vystoria.Images.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :url, :string

    belongs_to :user, Vystoria.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:url, :user_id])
    |> validate_required([:url, :user_id])
  end
end
