defmodule Test.EtatpropositionControllerTest do
  use Test.ConnCase

  alias Test.Etatproposition
  @valid_attrs %{libelle: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, etatproposition_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing etatpropositions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, etatproposition_path(conn, :new)
    assert html_response(conn, 200) =~ "New etatproposition"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, etatproposition_path(conn, :create), etatproposition: @valid_attrs
    assert redirected_to(conn) == etatproposition_path(conn, :index)
    assert Repo.get_by(Etatproposition, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, etatproposition_path(conn, :create), etatproposition: @invalid_attrs
    assert html_response(conn, 200) =~ "New etatproposition"
  end

  test "shows chosen resource", %{conn: conn} do
    etatproposition = Repo.insert! %Etatproposition{}
    conn = get conn, etatproposition_path(conn, :show, etatproposition)
    assert html_response(conn, 200) =~ "Show etatproposition"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, etatproposition_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    etatproposition = Repo.insert! %Etatproposition{}
    conn = get conn, etatproposition_path(conn, :edit, etatproposition)
    assert html_response(conn, 200) =~ "Edit etatproposition"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    etatproposition = Repo.insert! %Etatproposition{}
    conn = put conn, etatproposition_path(conn, :update, etatproposition), etatproposition: @valid_attrs
    assert redirected_to(conn) == etatproposition_path(conn, :show, etatproposition)
    assert Repo.get_by(Etatproposition, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    etatproposition = Repo.insert! %Etatproposition{}
    conn = put conn, etatproposition_path(conn, :update, etatproposition), etatproposition: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit etatproposition"
  end

  test "deletes chosen resource", %{conn: conn} do
    etatproposition = Repo.insert! %Etatproposition{}
    conn = delete conn, etatproposition_path(conn, :delete, etatproposition)
    assert redirected_to(conn) == etatproposition_path(conn, :index)
    refute Repo.get(Etatproposition, etatproposition.id)
  end
end
