defmodule DagPhx.Schemas.TeamMember do
  use Ecto.Schema
  import Ecto.Changeset

  alias DagPhx.Schemas.Team
  alias DagPhx.Schemas.AppUser

  schema "team_member" do
    belongs_to :team, Team
    belongs_to :user, AppUser
  end

  def changeset(member, params \\ %{}) do
    member
    |> cast(params, [:team_id, :user_id])
    |> unique_constraint(:unique_team_member, name: :unique_team_member)
  end
end
