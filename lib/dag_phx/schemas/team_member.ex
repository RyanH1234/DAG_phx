defmodule DagPhx.Schemas.TeamMember do
  use Ecto.Schema

  alias DagPhx.Schemas.Team
  alias DagPhx.Schemas.AppUser

  schema "team_member" do
    belongs_to :team, Team
    belongs_to :user, AppUser
  end
end
