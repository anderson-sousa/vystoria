defmodule Vystoria.Repo.Migrations.CreateRepresentatives do
  use Ecto.Migration

  def change do
    create table(:representatives) do
      add :type, :string
      add :name, :string
      add :cpf, :string
      add :phone, :string
      add :email, :string
      add :address, :string
      add :number, :string
      add :city, :string
      add :state, :string
      add :complement, :string
      add :cep, :string

      add :inspection_id, references(:inspections)

      timestamps()
    end

  end
end
