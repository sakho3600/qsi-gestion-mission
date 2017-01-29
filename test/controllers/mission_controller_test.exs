defmodule Test.MissionControllerTest do
  use Test.ConnCase

  alias Test.Mission
  @valid_attrs %{budget: "120.5", date_demarrage: %{day: 17, month: 4, year: 2010}, description: "some content", titre: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mission_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing missions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mission_path(conn, :new)
    assert html_response(conn, 200) =~ "New mission"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mission_path(conn, :create), mission: @valid_attrs
    assert redirected_to(conn) == mission_path(conn, :index)
    assert Repo.get_by(Mission, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mission_path(conn, :create), mission: @invalid_attrs
    assert html_response(conn, 200) =~ "New mission"
  end

  test "shows chosen resource", %{conn: conn} do
    mission = Repo.insert! %Mission{}
    conn = get conn, mission_path(conn, :show, mission)
    assert html_response(conn, 200) =~ "Show mission"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mission_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mission = Repo.insert! %Mission{}
    conn = get conn, mission_path(conn, :edit, mission)
    assert html_response(conn, 200) =~ "Edit mission"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mission = Repo.insert! %Mission{}
    conn = put conn, mission_path(conn, :update, mission), mission: @valid_attrs
    assert redirected_to(conn) == mission_path(conn, :show, mission)
    assert Repo.get_by(Mission, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mission = Repo.insert! %Mission{}
    conn = put conn, mission_path(conn, :update, mission), mission: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mission"
  end

  test "deletes chosen resource", %{conn: conn} do
    mission = Repo.insert! %Mission{}
    conn = delete conn, mission_path(conn, :delete, mission)
    assert redirected_to(conn) == mission_path(conn, :index)
    refute Repo.get(Mission, mission.id)
  end
end
