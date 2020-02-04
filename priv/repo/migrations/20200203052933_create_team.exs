defmodule DagPhx.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:team) do
      add :team_name, :string
      add :leader_id, references(:app_user)
    end
  end
end
