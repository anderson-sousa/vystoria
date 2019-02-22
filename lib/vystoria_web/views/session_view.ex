defmodule VystoriaWeb.SessionView do
  use VystoriaWeb, :view

  def render("show.json", session) do
    %{
      data: %{
        token: session.token
      }
    }
  end

  def render("400.json", %{message: message}) do
    %{
      errors: %{
        detail: message
      }
    }
  end
end
