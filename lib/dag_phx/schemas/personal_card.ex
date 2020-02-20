defmodule DagPhx.Schemas.PersonalCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias DagPhx.Schemas.Team

  schema "personal_card" do
    field :name, :string
    field :description, :string
    belongs_to :team, Team
  end

  def changeset(personal_card, params \\ %{}) do
    personal_card
    |> cast(params, [:name, :description, :team_id])
    |> validate_required([:name, :description, :team_id])
    |> unique_constraint(:name)
  end
end
