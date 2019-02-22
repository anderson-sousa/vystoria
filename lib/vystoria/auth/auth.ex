defmodule Vystoria.Auth do
  alias Vystoria.Auth.Token
  alias Vystoria.Auth.Session
  alias Vystoria.Accounts.User
  alias Vystoria.Repo

  def get_user_token(%User{} = user) do
    Token.new(user)
  end

  def verify_user_token(token) do
    Token.verify(token)
  end

  def authenticate(email, password) do
    case Comeonin.Bcrypt.check_pass(Repo.get_by(User, email: email), password) do
      {:ok, user} ->
        token = Token.new(user)
        Repo.insert(Ecto.build_assoc(user, :sessions, %{token: token}))

      _err ->
        {:error, "Wrong email or password"}
    end
  end

  def get_session(token) do
    Repo.get_by(Session, %{token: token})
  end

  def delete_session(%Session{} = session) do
    Repo.delete(session)
  end
end
