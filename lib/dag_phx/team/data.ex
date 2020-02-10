defmodule DagPhx.Team.Data do
  import Ecto.Query, only: [from: 2]

  alias DagPhx.Schemas.AppUser
  alias DagPhx.Schemas.Team
  alias DagPhx.Schemas.TeamMember

  def get_teams() do
    from t in Team,
    select: %{
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
end
