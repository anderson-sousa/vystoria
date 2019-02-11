defmodule Vystoria.Auth.Token do
  @moduledoc """
  Handles creating and validating tokens.
  """

  alias Vystoria.Accounts.User

  def generate_new_account_token(%User{id: user_id}) do
    Phoenix.Token.sign(VystoriaWeb.Endpoint, Application.get_env(:vystoria, VystoriaWeb.Endpoint)[:secret_key_base], user_id)
  end

  def verify_new_account_token(token) do
    Phoenix.Token.verify(VystoriaWeb.Endpoint, Application.get_env(:vystoria, VystoriaWeb.Endpoint)[:secret_key_base], token, max_age: 86_400)
  end
end
