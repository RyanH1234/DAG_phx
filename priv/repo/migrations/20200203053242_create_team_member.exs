defmodule DagPhx.Repo.Migrations.CreateTeamMember do
  use Ecto.Migration

  def change do
    create table(:team_member) do
      add :team_id, references(:team)
      add :user_id, references(:app_user)
    end
  end
end
