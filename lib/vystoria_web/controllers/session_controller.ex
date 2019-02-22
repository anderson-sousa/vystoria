defmodule VystoriaWeb.SessionController do
  use VystoriaWeb, :controller

  alias Vystoria.Auth

  def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate(email, password) do
      {:ok, session} ->
        conn
        |> put_status(:ok)
        |> render("show.json", session)

      {:error, reason} ->
        conn
        |> put_status(:unauthorized)
        |> put_view(VystoriaWeb.ErrorView)
        |> render("error.json", message: reason)
    end
  end

  def delete(conn, _) do
    Auth.delete_session(conn.assigns.session)
    conn |> send_resp(204, "")
  end
end
