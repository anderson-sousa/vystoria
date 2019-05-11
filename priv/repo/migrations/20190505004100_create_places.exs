defmodule Vystoria.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :address, :string
      add :number, :integer
      add :city, :string
      add :state, :string
      add :type, :string
      add :flors, :integer
      add :complement, :string
      add :cep, :string

      add :inspection_id, references(:inspections)

      timestamps()
    end

  end
end
