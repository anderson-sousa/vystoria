defmodule Vystoria.Inspections.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "items" do
    field :description, :string
    field :name, :string
    field :state, :string

    belongs_to :environment, Vystoria.Inspections.Environment

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :state, :description])
    |> validate_required([:name, :state, :description])
  end
end
