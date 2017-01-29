defmodule Test.Etatmission do
  use Test.Web, :model

  schema "etatmissions" do
    field :libelle, :string
    has_many :missions, Test.Mission
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:libelle])
    |> validate_required([:libelle])
  end
end
