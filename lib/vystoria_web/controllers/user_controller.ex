defmodule VystoriaWeb.UserController do
  use VystoriaWeb, :controller

  alias Vystoria.Accounts
  alias Vystoria.Accounts.User
  alias Vystoria.Email
  alias Vystoria.Mailer

  alias VystoriaWeb.Router.Helpers, as: Routes
  # alias VystoriaWeb.Endpoint

  action_fallback VystoriaWeb.FallbackController

  # def index(conn, _params) do
  #   users = Accounts.list_users()
  #   render(conn, "index.json", users: users)
  # end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      token = Vystoria.Auth.get_user_token(user)
      verification_url = Routes.user_url(conn, :verify_email, token: token)

      Email.confirm_account_email(user_params["email"], verification_url)
      |> Mailer.deliver_later()

      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def verify_email(conn, %{"token" => token}) do
    with {:ok, user_id} <- Vystoria.Auth.verify_user_token(token),
         %User{is_active: false} = user <- Vystoria.Accounts.get_user!(user_id) do
      Vystoria.Accounts.update_user(user, %{is_active: true})
      render(conn, "verified.html", email: user.email)
    else
      _ -> render(conn, "invalid_token.html")
    end
  end

  def verify_email(conn, _) do
    # If there is no token in our params, tell the user they've provided
    # an invalid token or expired token
    # conn
    # |> put_flash(:error, "The verification link is invalid.")
    # |> redirect(to: "/")
    render(conn, "invalid_token.html")
  end

  # def update(conn, %{"id" => id, "user" => user_params}) do
  #   user = Accounts.get_user!(id)

  #   with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
  #     render(conn, "show.json", user: user)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   user = Accounts.get_user!(id)

  #   with {:ok, %User{}} <- Accounts.delete_user(user) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
