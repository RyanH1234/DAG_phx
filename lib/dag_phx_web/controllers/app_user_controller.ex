defmodule DagPhxWeb.AppUserController do
  use DagPhxWeb, :controller

  alias DagPhx.Repo
  alias DagPhx.AppUser.Data
  alias DagPhx.Schemas.AppUser

  def index(conn, _params) do
    users =
      Data.get_users()
      |> Repo.all()

    json(conn, users)
  end

  def create(conn, %{
        "username" => username,
        "first_name" => first_name,
        "last_name" => last_name,
        "email_address" => email_address
      }) do

    user = %AppUser{
      username: username,
      first_name: first_name,
      last_name: last_name,
      email_address: email_address
    }

    {resp, _} = Repo.insert(user)
    json(conn, resp)
  end

  def retrieve_id(conn, %{"username" => username}) do
    [%{user_id: user_id}] =
      username
      |> Data.get_user_id()
      |> Repo.all()

    json(conn, [user_id])
  end
end
