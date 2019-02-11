defmodule Vystoria.Registration do
  use Vystoria.DataCase
  use ExUnit.Case
  use Bamboo.Test

  test "confirmation email" do
    {:ok, user} =
      Vystoria.Accounts.create_user(%{
        first_name: "Jose",
        last_name: "Silva",
        email: "jose.silva@email.com",
        password: "supers3cr3t"
      })

    token = Vystoria.Auth.get_user_token(user)

    verification_url =
      VystoriaWeb.Router.Helpers.user_path(VystoriaWeb.Endpoint, :verify_email, token: token)

    email = Vystoria.Email.confirm_account_email(user.email, verification_url)

    assert email.to == user.email
    assert email.html_body =~ "Estamos muito animados com o seu começo na nossa plataforma. Primeiro, você precisa confirmar a sua conta. Clique no botão abaixo."
  end
end
