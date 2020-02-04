defmodule DagPhx.Schemas.Card do
  use Ecto.Schema

  schema "card" do
    field :name, :string
    field :type, :string
    field :description, :string
  end
end