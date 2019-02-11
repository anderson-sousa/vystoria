defmodule VystoriaWeb.HelloController do
  use VystoriaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
