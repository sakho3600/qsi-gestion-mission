defmodule Test.MissionTest do
  use Test.ModelCase

  alias Test.Mission

  @valid_attrs %{budget: "120.5", date_demarrage: %{day: 17, month: 4, year: 2010}, description: "some content", titre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mission.changeset(%Mission{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mission.changeset(%Mission{}, @invalid_attrs)
    refute changeset.valid?
  end
end
