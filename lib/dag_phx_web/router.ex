defmodule DagPhxWeb.Router do
  use DagPhxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: "http://localhost:8080", methods: ["GET", "POST"]
  end

  scope "/", DagPhxWeb do
    pipe_through :api

    get "/users", AppUserController, :index
    post "/users", AppUserController, :create
    post "/users/username", AppUserController, :retrieve_id

    get "/teams", TeamController, :get_teams
    post "/teams", TeamController, :create_team
    post "/teams/members", TeamController, :add_team_members

    # TODO
    # why do we need options?
    options "/teams/members/id", TeamController, :retrieve_team_members
    post "/teams/members/id", TeamController, :retrieve_team_members

  end
end

