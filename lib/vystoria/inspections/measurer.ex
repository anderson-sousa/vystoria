defmodule Vystoria.Inspections.Measurer do
  use Ecto.Schema
  import Ecto.Changeset


  schema "measurers" do
    field :description, :string
    field :name, :string
    field :quantity, :string
    field :unit, :string

    belongs_to :inspection, Vystoria.Inspections.Inspection

    timestamps()
  end

  @doc false
  def changeset(measurer, attrs) do
    measurer
    |> cast(attrs, [:name, :description, :quantity, :unit])
    |> validate_required([:name, :description, :quantity, :unit])
  end
end
