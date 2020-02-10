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

  def create_team(conn, %{"team_name" => team_name, "leader_id" => leader_id}) do
    team = %Team{
      team_name: team_name,
      leader_id: leader_id
    }

    {resp, _} = Repo.insert(team)
    json(conn, resp)
  end

  def add_team_members(conn, %{"team_id" => team_id, "user_id" => user_id}) do
    team_member = %TeamMember{
      team_id: team_id,
      user_id: user_id
    }

    {resp, _} = Repo.insert(team_member)
    json(conn, resp)
  end

  def retrieve_team_members(conn, %{"team_id" => team_id}) do
    members =
      team_id
      |> Data.get_members()
      |> Repo.all()
      |> IO.inspect()

    json(conn, members)
  end
end
