defmodule Vystoria.Repo.Migrations.CreateMeasurers do
  use Ecto.Migration

  def change do
    create table(:measurers) do
      add :name, :string
      add :description, :string
      add :quantity, :string
      add :unit, :string

      add :inspection_id, references(:inspections)

      timestamps()
    end

  end
end
