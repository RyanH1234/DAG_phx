defmodule DagPhx.Repo.Migrations.CreatePersonalCard do
  use Ecto.Migration

  def change do
    create table(:personal_cards) do
      add :name, :string
      add :description, :string
      add :team_id, references(:team)
    end
  end
end
