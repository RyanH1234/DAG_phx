defmodule DagPhx.Schemas.GenericCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias DagPhx.Schemas.CardGenre

  schema "generic_card" do
    field :name, :string
    field :description, :string
    belongs_to :genre, CardGenre
  end

  def changeset(genric_card, params \\ %{}) do
    genric_card
    |> cast(params, [:name, :description, :genre_id])
    |> validate_required([:name, :description, :genre_id])
    |> unique_constraint(:name)
  end
end
