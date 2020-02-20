defmodule DagPhx.Repo.Migrations.CreateCardGenre do
  use Ecto.Migration

  def change do
    create table(:card_genre) do
      add :genre, :string
    end

    create unique_index(:card_genre, [:genre])
  end
end
