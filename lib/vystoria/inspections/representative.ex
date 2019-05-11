defmodule Vystoria.Inspections.Representative do
  use Ecto.Schema
  import Ecto.Changeset

  schema "representatives" do
    field :address, :string
    field :cep, :string
    field :city, :string
    field :complement, :string
    field :cpf, :string
    field :email, :string
    field :name, :string
    field :number, :string
    field :phone, :string
    field :state , :string
    field :type, :string

    belongs_to :inspection, Vystoria.Inspections.Inspection

    timestamps()
  end

  @doc false
  def changeset(representative, attrs) do
    representative
    |> cast(attrs, [:type, :name, :cpf, :phone, :email, :address, :number, :city, :state, :complement, :cep])
    |> validate_required([:type, :name, :cpf, :phone, :email, :address, :number, :city, :state, :complement, :cep])
  end
end
