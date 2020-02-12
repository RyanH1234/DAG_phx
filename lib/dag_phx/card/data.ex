defmodule DagPhx.Card.Data do
  import Ecto.Query, only: [from: 2]

  alias DagPhx.Schemas.CardGenre

  def get_genres() do
    from g in CardGenre,
      select: %{
        id: g.id,
        genre: g.genre
      }
  end
end
