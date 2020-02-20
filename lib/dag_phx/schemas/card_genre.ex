defmodule DagPhx.Schemas.CardGenre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "card_genre" do
    field :genre, :string
  end

  def changeset(genre, params \\ %{}) do
    genre
    |> cast(params, [:genre])
    |> validate_required([:genre])
    |> unique_constraint(:genre)
  end
end
