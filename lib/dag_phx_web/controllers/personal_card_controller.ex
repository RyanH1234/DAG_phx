defmodule DagPhxWeb.PersonalCardController do
  use DagPhxWeb, :controller

  alias DagPhx.Repo
  alias DagPhx.Schemas.PersonalCard
  alias DagPhx.PersonalCard.Data

  def get_cards(conn, %{"team_id" => team_id}) do
    cards =
      team_id
      |>Data.get_cards()
      |> Repo.all()

    json(conn, cards)
  end

  def create_card(conn, %{"name" => name, "description" => description, "team_id" => team_id}) do
    card = %PersonalCard{
      name: name,
      description: description,
      team_id: team_id
    }

    {resp, _} = Repo.insert(card)
    json(conn, resp)
  end
end
