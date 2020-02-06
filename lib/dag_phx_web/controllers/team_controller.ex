defmodule DagPhxWeb.TeamController do
  use DagPhxWeb, :controller

  alias DagPhx.Repo
  alias DagPhx.Team.Data
  alias DagPhx.Schemas.Team

  def index(conn, _params) do
    teams =
      Data.get_teams()
      |> Repo.all()

    json(conn, teams)
  end

  def create(conn, %{"team_name" => team_name, "leader_id" => leader_id}) do
    team = %Team{
      team_name: team_name,
      leader_id: leader_id
    }

    {resp, _} = Repo.insert(team)
    json(conn, resp)
  end
end
