defmodule Test.MissionController do
  use Test.Web, :controller

  alias Test.Mission

  def index(conn, _params) do
    missions = Repo.all(Mission)
    render(conn, "index.html", missions: missions)
  end

  def new(conn, _params) do
    changeset = Mission.changeset(%Mission{})
    #changeset = Mission.changeset(%Mission{}, :etatmissions)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mission" => mission_params}) do
    changeset = Mission.changeset(%Mission{}, mission_params)

    case Repo.insert(changeset) do
      {:ok, _mission} ->
        conn
        |> put_flash(:info, "Mission created successfully.")
        |> redirect(to: mission_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mission = Repo.get!(Mission, id)
    render(conn, "show.html", mission: mission)
  end

  def edit(conn, %{"id" => id}) do
    mission = Repo.get!(Mission, id)
    changeset = Mission.changeset(mission)
    render(conn, "edit.html", mission: mission, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mission" => mission_params}) do
    mission = Repo.get!(Mission, id)
    changeset = Mission.changeset(mission, mission_params)

    case Repo.update(changeset) do
      {:ok, mission} ->
        conn
        |> put_flash(:info, "Mission updated successfully.")
        |> redirect(to: mission_path(conn, :show, mission))
      {:error, changeset} ->
        render(conn, "edit.html", mission: mission, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mission = Repo.get!(Mission, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mission)

    conn
    |> put_flash(:info, "Mission deleted successfully.")
    |> redirect(to: mission_path(conn, :index))
  end
end
