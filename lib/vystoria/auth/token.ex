defmodule Vystoria.Auth.Token do
  @moduledoc """
  Handles creating and verifying tokens.
  """
  alias VystoriaWeb.Endpoint
  alias Vystoria.Accounts.User
  @secret_key_base Application.get_env(:vystoria, Endpoint)[:secret_key_base]

  def new(%User{id: user_id}) do
    Phoenix.Token.sign(Endpoint, @secret_key_base, user_id)
  end

  def verify(token) do
    Phoenix.Token.verify(Endpoint, @secret_key_base, token, max_age: 86_400)
  end
end
