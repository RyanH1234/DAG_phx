defmodule DagPhx.Repo.Migrations.CreateAppUser do
  use Ecto.Migration

  def change do
    create table(:app_user) do
      add :username, :string
      add :first_name, :string
      add :last_name, :string
      add :email_address, :string
    end

    create unique_index(:app_user, [:username])
  end
end
