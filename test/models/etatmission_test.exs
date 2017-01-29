defmodule Test.EtatmissionTest do
  use Test.ModelCase

  alias Test.Etatmission

  @valid_attrs %{libelle: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Etatmission.changeset(%Etatmission{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Etatmission.changeset(%Etatmission{}, @invalid_attrs)
    refute changeset.valid?
  end
end
