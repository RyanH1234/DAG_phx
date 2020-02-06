defmodule DagPhx.Team.Data do
  import Ecto.Query, only: [from: 2]

  alias DagPhx.Schemas.Team

  def get_teams() do
    from t in Team,
    select: %{
      team_name: t.team_name
    }
  end
end
