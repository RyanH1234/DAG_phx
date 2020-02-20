defmodule DagPhxWeb.GenericCardController do
  use DagPhxWeb, :controller

  alias DagPhx.Repo
  alias DagPhx.GenericCard.Data
  alias DagPhx.Schemas.CardGenre

  def get_genres(conn, _params) do
    query = Data.get_genres()
    genres = Repo.all(query)
    json(conn, genres)
  end

  def create_genre(conn, %{"genre" => genre}) do
    genre = %{
      genre: genre
    }

    changeset = CardGenre.changeset(%CardGenre{}, genre)

    case Repo.insert(changeset) do
      {:ok, _} ->
        json(conn, :ok)

      {:error, _} ->
        json(conn, :error)
    end
  end
end
