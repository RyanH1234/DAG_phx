defmodule DagPhx.PersonalCard.Data do
  import Ecto.Query, only: [from: 2]

  alias DagPhx.Schemas.PersonalCard

  def get_cards(team_id) do
    from p in PersonalCard,
    where: p.team_id == ^team_id,
      select: %{
        id: p.id,
        name: p.name,
        description: p.description
      }
  end
end
