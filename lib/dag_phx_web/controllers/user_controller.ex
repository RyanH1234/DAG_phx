defmodule DagPhxWeb.UserController do
  use DagPhxWeb, :controller

  # GET /users
  def index(conn, _params) do
    json(conn, ["index"])
  end

  # GET /users/:id/edit
  def edit(conn, _params) do
    json(conn, ["edit"])
  end

  # GET /users/new
  def new(conn, _params) do
    json(conn, ["new"])
  end

  # GET /users/:id
  def show(conn, _params) do
    json(conn, ["show"])
  end

  # POST /users
  def create(conn, _params) do
    json(conn, ["create"])
  end

  # PATCH/PUT/DELETE /users/:id
  def update(conn, _params) do
    json(conn, ["update"])
  end

  # DELETE /users/:id
  def delete(conn, _params) do
    json(conn, ["delete"])
  end
end
