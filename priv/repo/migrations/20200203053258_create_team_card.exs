defmodule DagPhx.Repo.Migrations.CreateTeamCard do
  use Ecto.Migration

  def change do
    create table(:team_card) do
      add :team_id, references(:team)
      add :card_id, references(:card)
      add :order, :integer
    end
  end
end
