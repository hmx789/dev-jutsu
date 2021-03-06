defmodule DevJutsuWeb.Router do
  use DevJutsuWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug Phoenix.LiveView.Flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DevJutsuWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/tables", TableController, only: [:new, :create, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", DevJutsuWeb do
  #   pipe_through :api
  # end
end
