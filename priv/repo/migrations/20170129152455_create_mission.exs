defmodule Test.Repo.Migrations.CreateMission do
  use Ecto.Migration

  def change do
    create table(:missions) do
      add :titre, :string
      add :description, :text
      add :budget, :float
      add :date_demarrage, :date
      add :etatmissions_id, references(:etatmissions, on_delete: :nothing)

      timestamps()
    end
    create index(:missions, [:etatmissions_id])

  end
end
