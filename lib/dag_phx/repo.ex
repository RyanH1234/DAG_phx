defmodule DagPhx.Repo do
  use Ecto.Repo,
    otp_app: :dag_phx,
    adapter: Ecto.Adapters.Postgres
end
