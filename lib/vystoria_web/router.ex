defmodule VystoriaWeb.Router do
  use VystoriaWeb, :router

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

  pipeline :api_authenticated do
    plug VystoriaWeb.Plug.VerifyHeader
  end

  scope "/", VystoriaWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/verify", UserController, :verify_email
  end

  scope "/api/v1", VystoriaWeb do
    pipe_through(:api)

    get "/", HelloController, :index
    resources "/users", UserController, only: [:create, :show]

    scope "/sessions" do
      post "/sign_in", SessionController, :create
    end
  end

  scope "/api/v1", VystoriaWeb do
    pipe_through(:api_authenticated)

    scope "/sessions" do
      delete "/sign_out", SessionController, :delete
    end
  end
end
