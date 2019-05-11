defmodule Vystoria.Inspections.Inspection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inspections" do
    field :motivation, :string
    field :status, :string

    belongs_to :user, Vystoria.Accounts.User
    has_many :places, Vystoria.Inspections.Place
    has_many :representatives, Vystoria.Inspections.Representative
    has_many :measurers, Vystoria.Inspections.Measurer

    timestamps()
  end

  @doc false
  def changeset(inspection, attrs) do
    inspection
    |> cast(attrs, [:status, :motivation])
    |> validate_required([:status, :motivation])
  end
end
