defmodule Vystoria.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :url, :string
      add :user_id, references(:users)

      timestamps()
    end
  end
end
