defmodule Vystoria.Repo.Migrations.CreateInspections do
  use Ecto.Migration

  def change do
    create table(:inspections) do
      add(:status, :string)
      add(:motivation, :string)

      add(:user_id, references(:users))

      timestamps()
    end

  end
end
