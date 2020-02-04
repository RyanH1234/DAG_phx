defmodule DagPhx.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:card) do
      add :name, :string
      add :type, :string
      add :description, :string
    end
  end
end
