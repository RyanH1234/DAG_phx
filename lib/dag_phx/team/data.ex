defmodule DagPhx.Team.Data do
  import Ecto.Query, only: [from: 2]

  alias DagPhx.Schemas.AppUser
  alias DagPhx.Schemas.Team
  alias DagPhx.Schemas.TeamMember

  def get_teams() do
    from t in Team,
    select: %{
      id: t.id,
      team_name: t.team_name
    }
  end

  def get_users_team(user_id) do
    from tm in TeamMember,
    join: t in Team, on: t.id == tm.team_id,
    where: tm.user_id == ^user_id,
    order_by: t.id,
    select: %{
      team_id: t.id,
      team_name: t.team_name
    }
  end

  def get_members(team_id) do
    from tm in TeamMember,
    join: t in Team, on: t.id == tm.team_id,
    join: u in AppUser, on: u.id == tm.user_id,
    where: t.id == ^team_id,
    select: %{
      id: tm.id,
      username: u.username
    }
  end

  def get_team(team_id) do
    from t in Team,
    where: t.id == ^team_id
  end
end
