defmodule DagPhx.Schemas.TeamCard do
  use Ecto.Schema

  alias DagPhx.Schemas.Team
  alias DagPhx.Schemas.Card

  schema "team_card" do
    field :order, :integer
    belongs_to :team, Team
    belongs_to :card, Card
  end
end