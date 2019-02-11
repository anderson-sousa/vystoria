defmodule Vystoria.AuthTest do
  use Vystoria.DataCase

  describe "user token" do
    test "genarate and verify" do
      {:ok, user} =
        Vystoria.Accounts.create_user(%{
          first_name: "Jose",
          last_name: "Silva",
          email: "jose.silva@email.com",
          password: "supers3cr3t"
        })

      token = Vystoria.Auth.get_user_token(user)
      assert {:ok, user.id} == Vystoria.Auth.verify_user_token(token)
    end
  end
end
