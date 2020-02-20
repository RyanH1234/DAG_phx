defmodule DagPhxWeb.AppUserController do
  use DagPhxWeb, :controller

  alias DagPhx.Repo
  alias DagPhx.AppUser.Data
  alias DagPhx.Schemas.AppUser

  def get_users(conn, _params) do
    users =
      Data.get_users()
      |> Repo.all()

    json(conn, users)
  end

  def create_user(conn, %{
        "username" => username,
        "first_name" => first_name,
        "last_name" => last_name,
        "email_address" => email_address
      }) do

    user = %{
      username: username,
      first_name: first_name,
      last_name: last_name,
      email_address: email_address
    }

    changeset = AppUser.changeset(%AppUser{}, user)

    case Repo.insert(changeset) do
      {:ok, _} ->
        json(conn, :ok)

      {:error, _} ->
        json(conn, :error)
    end
  end
end
