defmodule Test.EtatpropositionTest do
  use Test.ModelCase

  alias Test.Etatproposition

  @valid_attrs %{libelle: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Etatproposition.changeset(%Etatproposition{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Etatproposition.changeset(%Etatproposition{}, @invalid_attrs)
    refute changeset.valid?
  end
end
