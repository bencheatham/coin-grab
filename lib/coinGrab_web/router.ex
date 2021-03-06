defmodule CoinGrabWeb.Router do
  use CoinGrabWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CoinGrabWeb do
    pipe_through :browser

    resources "/", PageController, only: [:index, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CoinGrabWeb do
  #   pipe_through :api
  # end
end
