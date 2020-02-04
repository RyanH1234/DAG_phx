defmodule DagPhxWeb.Router do
  use DagPhxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DagPhxWeb do
    pipe_through :api

    resources "/users", UserController
  end
end

