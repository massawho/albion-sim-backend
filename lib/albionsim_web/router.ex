defmodule AlbionsimWeb.Router do
  use AlbionsimWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug
  end

  scope "/api", AlbionsimWeb do
    pipe_through :api
    resources "/resources", ResourceController, except: [:new, :edit]
  end

  scope "/", AlbionsimWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AlbionsimWeb do
  #   pipe_through :api
  # end
end
