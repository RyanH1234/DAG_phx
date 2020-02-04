defmodule DagPhx.Schemas.AppUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "app_user" do
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :email_address, :string
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:username, :firstname, :lastname, :email_address])
    |> validate_required([:username, :firstname, :lastname, :email_address])
    |> unique_constraint(:username)
  end
end
