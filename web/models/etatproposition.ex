defmodule Test.Etatproposition do
  use Test.Web, :model

  schema "etatpropositions" do
    field :libelle, :string

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
