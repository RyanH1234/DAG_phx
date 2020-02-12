defmodule DagPhxWeb.Router do
  use DagPhxWeb, :router

  pipeline :api do
    plug CORSPlug, [origin: "http://localhost:8080"]
    plug :accepts, ["json"]
  end

  # TODO - rename these endpoints properly....
  scope "/", DagPhxWeb do
    pipe_through :api

    get "/users", AppUserController, :index
    post "/users", AppUserController, :create
    post "/users/username", AppUserController, :retrieve_id

    get "/teams", TeamController, :get_teams

    options "/teams/id", TeamController, :options
    post "/teams/id", TeamController, :get_team

    post "/teams", TeamController, :create_team

    options "/teams/members", TeamController, :options
    post "/teams/members", TeamController, :add_team_members

    options "/teams/members/id", TeamController, :options
    post "/teams/members/id", TeamController, :retrieve_team_members

    get "/cards/genres", CardController, :get_genres
    post "/cards/genre", CardController, :create_genre
  end
end

