defmodule DagPhxWeb.CardController do
  use DagPhxWeb, :controller

  alias DagPhx.Repo
  alias DagPhx.Card.Data
  alias DagPhx.Schemas.CardGenre

  def get_genres(conn, _params) do
    query = Data.get_genres()
    genres = Repo.all(query)
    json(conn, genres)
  end

  def create_genre(conn, %{"genre" => genre}) do
    genre = %CardGenre{
      genre: genre
    }

    {resp, _} = Repo.insert(genre)
    json(conn, resp)
  end
end
