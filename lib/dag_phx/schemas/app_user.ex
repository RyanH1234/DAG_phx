defmodule DagPhx.Schemas.AppUser do
  use Ecto.Schema

  schema "app_user" do
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :email_address, :string
  end
end