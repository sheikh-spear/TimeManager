defmodule TimeManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string, null: false 
      add :password_hash, :string
      add :is_active, :boolean, default: false, null: false
      add :is_manager, :boolean, default: false, null: false
      add :is_general_manager, :boolean, default: false, null: false
      add :start, :naive_datetime
      add :status, :boolean, default: false
      add :manager, {:array, :binary_id}
      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
