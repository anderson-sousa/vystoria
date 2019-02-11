defmodule Vystoria.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:first_name, :string, null: false)
      add(:last_name, :string, null: false)
      add(:is_active, :boolean, null: false, default: false)
      add(:is_push_notifications_activated, :boolean, null: false, default: true)
      add(:is_email_notifications_activated, :boolean, null: false, default: true)
      add(:email, :string, null: false)
      add(:password_hash, :string, null: false)

      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end
