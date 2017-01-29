defmodule Test.Repo.Migrations.CreateEtatmission do
  use Ecto.Migration

  def change do
    create table(:etatmissions) do
      add :libelle, :string

      timestamps()
    end

  end
end
