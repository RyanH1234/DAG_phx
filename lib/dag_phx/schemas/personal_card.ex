defmodule DagPhx.Schemas.PersonalCard do
  use Ecto.Schema

  alias DagPhx.Schemas.Team

  schema "personal_card" do
    field :name, :string
    field :description, :string
    belongs_to :team, Team
  end
end
