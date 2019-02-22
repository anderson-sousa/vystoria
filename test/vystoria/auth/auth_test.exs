defmodule Vystoria.AuthTest do
  use Vystoria.DataCase

  @create_attrs %{
    first_name: "Jose",
    last_name: "Silva",
    email: "jose.silva@email.com",
    password: "supers3cr3t"
  }

  def user_fixture() do
    {:ok, user} = Vystoria.Accounts.create_user(@create_attrs)
    user
  end

  describe "tokens" do
    test "genarate and verify token" do
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

  describe "users" do
    test "authenticate valid user" do
      assert {:error, "Wrong email or password"} = Vystoria.Auth.authenticate("wrong email", "")
    end

    test "authenticate invalid user" do
      user = user_fixture()

      assert {:ok, %Vystoria.Auth.Session{}} = Vystoria.Auth.authenticate(user.email, @create_attrs.password)
    end
  end

  describe "sessions" do
    test "get_session/1 returns the session" do
      user_fixture()
      {:ok, session} = Vystoria.Auth.authenticate(@create_attrs.email, @create_attrs.password)
      assert session == Vystoria.Auth.get_session(session.token)
    end

    test "delete_session/1 deletes the session" do
      user_fixture()
      {:ok, session} = Vystoria.Auth.authenticate(@create_attrs.email, @create_attrs.password)
      assert {:ok, %Vystoria.Auth.Session{}} = Vystoria.Auth.delete_session(session)
      assert nil == Vystoria.Auth.get_session(session.token)
    end
  end
end
