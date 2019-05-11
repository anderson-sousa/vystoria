defmodule Vystoria.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :state, :string
      add :description, :string

      add :environment_id, references(:environments)

      timestamps()
    end

  end
end
