defmodule TimeManager.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start, :naive_datetime, null: false
      add :status, :boolean, default: true, null: false
      add :user, references(:users, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:clocks, [:user])
  end
end
