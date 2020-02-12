defmodule DagPhx.Repo.Migrations.CreateGenericCard do
  use Ecto.Migration

  def change do
    create table(:generic_card) do
      add :name, :string
      add :description, :string
      add :genre_id, references(:card_genre)
    end
  end
end
