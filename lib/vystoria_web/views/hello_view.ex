defmodule VystoriaWeb.HelloView do
  use VystoriaWeb, :view

  def render("index.json", %{}) do
    %{
      hello: "world"
    }
  end
end
