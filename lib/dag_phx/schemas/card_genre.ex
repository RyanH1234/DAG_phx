defmodule DagPhx.Schemas.CardGenre do
  use Ecto.Schema

  schema "card_genre" do
    field :genre, :string
  end
end
