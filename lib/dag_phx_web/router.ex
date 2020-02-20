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

    options "/teams", TeamController, :options
    post "/teams", TeamController, :create_team

    get "/teams/:user_id", TeamController, :get_users_team

    options "/teams/name/:team_id", TeamController, :options
    patch "/teams/name/:team_id", TeamController, :update_team_name

    options "/teams/members", TeamController, :options
    post "/teams/members", TeamController, :add_team_members

    get "/teams/members/:team_id", TeamController, :get_team_members

    get "/generic-cards/genres", GenericCardController, :get_genres
    post "/generic-cards/genre", GenericCardController, :create_genre

    get "/personal-cards/:team_id", PersonalCardController, :get_cards

    options "/personal-cards/", PersonalCardController, :options
    post "/personal-cards/", PersonalCardController, :create_card
  end
end

