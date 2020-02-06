defmodule DagPhxWeb.Router do
  use DagPhxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DagPhxWeb do
    pipe_through :api

    get "/users", AppUserController, :index
    post "/users", AppUserController, :create
    post "/users/username", AppUserController, :retrieve_id

    get "/teams", TeamController, :index
    post "/teams", TeamController, :create
  end
end

