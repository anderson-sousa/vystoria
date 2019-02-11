defmodule Vystoria.Auth do
  alias Vystoria.Auth.Token
  alias Vystoria.Accounts.User

  def get_user_token(%User{} = user) do
    Token.generate_new_account_token(user)
  end

  def verify_user_token(token) do
    Token.verify_new_account_token(token)
  end
end
