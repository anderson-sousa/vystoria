defmodule VystoriaWeb.Router do
  use VystoriaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :upload do
    plug :accepts, ["html"]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :logging do
    plug Timber.Plug.Event
  end

  pipeline :api_authenticated do
    plug VystoriaWeb.Plug.VerifyHeader
  end

  scope "/", VystoriaWeb do
    pipe_through(:browser)
    if Mix.env() == :prod, do: pipe_through(:logging)

    get "/", PageController, :index
    get "/verify", UserController, :verify_email
  end

  scope "/api/v1", VystoriaWeb do
    pipe_through(:api)
    if Mix.env() == :prod, do: pipe_through(:logging)

    get "/", HelloController, :index
    resources "/users", UserController, only: [:create]

    scope "/sessions" do
      post "/sign_in", SessionController, :create
    end
  end

  scope "/api/v1", VystoriaWeb do
    pipe_through(:api)
    pipe_through(:api_authenticated)
    if Mix.env() == :prod, do: pipe_through(:logging)

    scope "/sessions" do
      delete "/sign_out", SessionController, :delete
    end
  end

  scope "/api/v1", VystoriaWeb do
    pipe_through(:api_authenticated)
    pipe_through(:upload)
    if Mix.env() == :prod, do: pipe_through(:logging)

    resources "/photos", PhotoController, only: [:create]
  end
end
