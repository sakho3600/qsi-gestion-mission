defmodule Test.EtatmissionController do
  use Test.Web, :controller

  alias Test.Etatmission

  def index(conn, _params) do
    etatmissions = Repo.all(Etatmission)
    render(conn, "index.html", etatmissions: etatmissions)
  end

  def new(conn, _params) do
    changeset = Etatmission.changeset(%Etatmission{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"etatmission" => etatmission_params}) do
    changeset = Etatmission.changeset(%Etatmission{}, etatmission_params)

    case Repo.insert(changeset) do
      {:ok, _etatmission} ->
        conn
        |> put_flash(:info, "Etatmission created successfully.")
        |> redirect(to: etatmission_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    etatmission = Repo.get!(Etatmission, id)
    render(conn, "show.html", etatmission: etatmission)
  end

  def edit(conn, %{"id" => id}) do
    etatmission = Repo.get!(Etatmission, id)
    changeset = Etatmission.changeset(etatmission)
    render(conn, "edit.html", etatmission: etatmission, changeset: changeset)
  end

  def update(conn, %{"id" => id, "etatmission" => etatmission_params}) do
    etatmission = Repo.get!(Etatmission, id)
    changeset = Etatmission.changeset(etatmission, etatmission_params)

    case Repo.update(changeset) do
      {:ok, etatmission} ->
        conn
        |> put_flash(:info, "Etatmission updated successfully.")
        |> redirect(to: etatmission_path(conn, :show, etatmission))
      {:error, changeset} ->
        render(conn, "edit.html", etatmission: etatmission, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    etatmission = Repo.get!(Etatmission, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(etatmission)

    conn
    |> put_flash(:info, "Etatmission deleted successfully.")
    |> redirect(to: etatmission_path(conn, :index))
  end
end
