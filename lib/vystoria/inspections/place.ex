defmodule Vystoria.Inspections.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :address, :string
    field :cep, :string
    field :city, :string
    field :complement, :string
    field :flors, :integer
    field :number, :integer
    field :state, :string
    field :type, :string

    belongs_to :inspection, Vystoria.Inspections.Inspection

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:number, :city, :state, :type, :flors, :complement, :cep])
    |> validate_required([:number, :city, :state, :type, :flors, :complement, :cep])
  end
end
