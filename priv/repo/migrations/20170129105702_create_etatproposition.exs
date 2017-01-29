defmodule Test.Repo.Migrations.CreateEtatproposition do
  use Ecto.Migration

  def change do
    create table(:etatpropositions) do
      add :libelle, :string

      timestamps()
    end

  end
end
