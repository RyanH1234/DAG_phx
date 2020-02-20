defmodule DagPhx.Repo.Migrations.CreatePersonalCard do
  use Ecto.Migration

  def change do
    create table(:personal_card) do
      add :name, :string
      add :description, :string
      add :team_id, references(:team)
    end

    create unique_index(:personal_card, [:name])
  end
end
