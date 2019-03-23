defmodule VystoriaWeb.Plug.VerifyHeader do
  use Plug.Builder
  import Phoenix.Controller
  alias Vystoria.Auth.Token

  def call(conn, _default) do
    case get_auth_token(conn) do
      {:ok, token} ->
        case Vystoria.Repo.get_by(Vystoria.Auth.Session, %{token: token, revoked: false})
             |> Vystoria.Repo.preload(:user) do
          nil -> unauthorized(conn, "session not found")
          session -> authorized(conn, session)
        end

      {:error, :invalid} ->
        unauthorized(conn, "session invalid")

      {:error, :missing_auth_header} ->
        unauthorized(conn, "authorization header not present")

      {:error, :token_not_found} ->
        unauthorized(conn, "token not found")

      {:error, :expired} ->
        unauthorized(conn, "session expired")
    end
  end

  defp authorized(conn, session) do
    conn
    |> assign(:session, session)
  end

  defp unauthorized(conn, message) do
    conn
    |> put_status(:bad_request)
    |> put_view(VystoriaWeb.ErrorView)
    |> render("error.json", %{message: message})
    |> halt()
  end

  defp get_auth_token(conn) do
    case extract_token(conn) do
      {:ok, token} ->
        case Token.verify(token) do
          {:ok, _user_id} -> {:ok, token}
          {:error, error} -> {:error, error}
        end

      error ->
        error
    end
  end

  defp extract_token(conn) do
    case Plug.Conn.get_req_header(conn, "authorization") do
      [auth_header] -> get_token_from_header(auth_header)
      _ -> {:error, :missing_auth_header}
    end
  end

  defp get_token_from_header(auth_header) do
    {:ok, reg} = Regex.compile("Bearer\:?\s+(.*)$", "i")

    case Regex.run(reg, auth_header) do
      [_, match] -> {:ok, String.trim(match)}
      _ -> {:error, :token_not_found}
    end
  end
end
