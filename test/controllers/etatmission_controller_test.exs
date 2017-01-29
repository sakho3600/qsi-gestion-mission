defmodule Test.EtatmissionControllerTest do
  use Test.ConnCase

  alias Test.Etatmission
  @valid_attrs %{libelle: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, etatmission_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing etatmissions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, etatmission_path(conn, :new)
    assert html_response(conn, 200) =~ "New etatmission"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, etatmission_path(conn, :create), etatmission: @valid_attrs
    assert redirected_to(conn) == etatmission_path(conn, :index)
    assert Repo.get_by(Etatmission, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, etatmission_path(conn, :create), etatmission: @invalid_attrs
    assert html_response(conn, 200) =~ "New etatmission"
  end

  test "shows chosen resource", %{conn: conn} do
    etatmission = Repo.insert! %Etatmission{}
    conn = get conn, etatmission_path(conn, :show, etatmission)
    assert html_response(conn, 200) =~ "Show etatmission"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, etatmission_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    etatmission = Repo.insert! %Etatmission{}
    conn = get conn, etatmission_path(conn, :edit, etatmission)
    assert html_response(conn, 200) =~ "Edit etatmission"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    etatmission = Repo.insert! %Etatmission{}
    conn = put conn, etatmission_path(conn, :update, etatmission), etatmission: @valid_attrs
    assert redirected_to(conn) == etatmission_path(conn, :show, etatmission)
    assert Repo.get_by(Etatmission, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    etatmission = Repo.insert! %Etatmission{}
    conn = put conn, etatmission_path(conn, :update, etatmission), etatmission: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit etatmission"
  end

  test "deletes chosen resource", %{conn: conn} do
    etatmission = Repo.insert! %Etatmission{}
    conn = delete conn, etatmission_path(conn, :delete, etatmission)
    assert redirected_to(conn) == etatmission_path(conn, :index)
    refute Repo.get(Etatmission, etatmission.id)
  end
end
