defmodule DagPhxWeb.TeamController do
  use DagPhxWeb, :controller

  alias DagPhx.Repo
  alias DagPhx.Team.Data
  alias DagPhx.Schemas.Team
  alias DagPhx.Schemas.TeamMember

  def get_teams(conn, _params) do
    teams =
      Data.get_teams()
      |> Repo.all()

    json(conn, teams)
  end

  def get_users_team(conn, %{"user_id" => user_id}) do
    team =
      user_id
      |> String.to_integer()
      |> Data.get_users_team()
      |> Repo.all()

    json(conn, team)
  end

  def create_team(conn, %{"team_name" => team_name, "leader_id" => leader_id}) do
    team = %{
      team_name: team_name,
      leader_id: leader_id
    }

    changeset = Team.changeset(%Team{}, team)

    case Repo.insert(changeset) do
      {:ok, params} ->
        %Team{id: team_id} = params
        json(conn, team_id)

      {:error, _} ->
        json(conn, :error)
    end
  end

  def update_team_name(conn, %{"team_id" => team_id, "team_name" => team_name}) do
    team_id
    |> Data.get_team()
    |> Repo.update_all(set: [team_name: team_name])

    json(conn, "ok")
  end

  def add_team_members(conn, %{"team_id" => team_id, "user_id" => user_id}) do
    team_member = %{
      team_id: team_id,
      user_id: user_id
    }

    changeset = TeamMember.changeset(%TeamMember{}, team_member)

    case Repo.insert(changeset) do
      {:ok, _} ->
        json(conn, :ok)

      {:error, _} ->
        json(conn, :error)
    end
  end

  def get_team_members(conn, %{"team_id" => team_id}) do
    members =
      team_id
      |> Data.get_members()
      |> Repo.all()

    json(conn, members)
  end

  def options(_conn, _params), do: [:ok]
end
