defmodule DagPhx.Schemas.Team do
  use Ecto.Schema

  alias DagPhx.Schemas.AppUser

  schema "team" do
    field :team_name, :string
    belongs_to :leader, AppUser
  end
end