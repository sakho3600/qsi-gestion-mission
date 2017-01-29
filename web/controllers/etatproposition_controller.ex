defmodule Test.EtatpropositionController do
  use Test.Web, :controller

  alias Test.Etatproposition

  def index(conn, _params) do
    etatpropositions = Repo.all(Etatproposition)
    render(conn, "index.html", etatpropositions: etatpropositions)
  end

  def new(conn, _params) do
    changeset = Etatproposition.changeset(%Etatproposition{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"etatproposition" => etatproposition_params}) do
    changeset = Etatproposition.changeset(%Etatproposition{}, etatproposition_params)

    case Repo.insert(changeset) do
      {:ok, _etatproposition} ->
        conn
        |> put_flash(:info, "Etatproposition created successfully.")
        |> redirect(to: etatproposition_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    etatproposition = Repo.get!(Etatproposition, id)
    render(conn, "show.html", etatproposition: etatproposition)
  end

  def edit(conn, %{"id" => id}) do
    etatproposition = Repo.get!(Etatproposition, id)
    changeset = Etatproposition.changeset(etatproposition)
    render(conn, "edit.html", etatproposition: etatproposition, changeset: changeset)
  end

  def update(conn, %{"id" => id, "etatproposition" => etatproposition_params}) do
    etatproposition = Repo.get!(Etatproposition, id)
    changeset = Etatproposition.changeset(etatproposition, etatproposition_params)

    case Repo.update(changeset) do
      {:ok, etatproposition} ->
        conn
        |> put_flash(:info, "Etatproposition updated successfully.")
        |> redirect(to: etatproposition_path(conn, :show, etatproposition))
      {:error, changeset} ->
        render(conn, "edit.html", etatproposition: etatproposition, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    etatproposition = Repo.get!(Etatproposition, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(etatproposition)

    conn
    |> put_flash(:info, "Etatproposition deleted successfully.")
    |> redirect(to: etatproposition_path(conn, :index))
  end
end
