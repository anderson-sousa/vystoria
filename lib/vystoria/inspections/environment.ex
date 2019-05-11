defmodule Vystoria.Inspections.Environment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "environments" do
    field :name, :string

    belongs_to :inspection, Vystoria.Inspections.Inspection
    has_many :item, Vystoria.Inspections.Item

    timestamps()
  end

  @doc false
  def changeset(environment, attrs) do
    environment
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
