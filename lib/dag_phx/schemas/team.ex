defmodule DagPhx.Schemas.Team do
  use Ecto.Schema
  import Ecto.Changeset

  alias DagPhx.Schemas.AppUser

  schema "team" do
    field :team_name, :string
    belongs_to :leader, AppUser
  end

  def changeset(team, params \\ %{}) do
    team
    |> cast(params, [:team_name, :leader_id])
    |> validate_required([:team_name, :leader_id])
    |> unique_constraint(:team_name)
  end
end
