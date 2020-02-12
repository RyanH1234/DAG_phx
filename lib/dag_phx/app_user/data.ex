defmodule DagPhx.AppUser.Data do
  import Ecto.Query, only: [from: 2]

  alias DagPhx.Schemas.AppUser

  def get_users() do
    from u in AppUser,
      select: %{
        id: u.id,
        username: u.username,
        first_name: u.first_name,
        last_name: u.last_name,
        email_address: u.email_address
      }
  end
end
