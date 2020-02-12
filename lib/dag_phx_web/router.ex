defmodule DagPhxWeb.Router do
  use DagPhxWeb, :router

  pipeline :api do
    plug CORSPlug, [origin: "http://localhost:8080"]
    plug :accepts, ["json"]
  end

  scope "/", DagPhxWeb do
    pipe_through :api

    get "/users", AppUserController, :get_users
    post "/users", AppUserController, :create_user

    get "/teams", TeamController, :get_teams
    post "/teams", TeamController, :create_team
    get "/teams/:user_id", TeamController, :get_team

    get "/teams/members/:team_id", TeamController, :get_team_members
    post "/teams/members", TeamController, :add_team_members

    get "/generic-cards/genres", GenericCardController, :get_genres
    post "/generic-cards/genre", GenericCardController, :create_genre

    get "/personal-cards/:team_id", PersonalCardController, :get_cards
    post "/personal-cards/", PersonalCardController, :create_card
  end
end

