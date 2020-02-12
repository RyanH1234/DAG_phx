defmodule DagPhx.Schemas.GenericCard do
  use Ecto.Schema

  alias DagPhx.Schemas.CardGenre

  schema "generic_card" do
    field :name, :string
    field :description, :string
    belongs_to :genre, CardGenre
  end
end
