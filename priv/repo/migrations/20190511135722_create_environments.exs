defmodule Vystoria.Repo.Migrations.CreateEnvironments do
  use Ecto.Migration

  def change do
    create table(:environments) do
      add :name, :string

      add :inspection_id, references(:inspections)

      timestamps()
    end

  end
end
