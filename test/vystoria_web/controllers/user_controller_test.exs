defmodule VystoriaWeb.UserControllerTest do
  use VystoriaWeb.ConnCase
  import Vystoria.Factory

  alias Vystoria.Accounts
  # alias Vystoria.Accounts.User

  @create_attrs %{
    first_name: "Jose",
    last_name: "Silva",
    email: "jose.silva@email.com",
    password: "supers3cr3t"
  }
  # @update_attrs %{
  #   email: "some updated email",
  #   password_hash: "some updated password_hash"
  # }
  @invalid_attrs %{
    first_name: nil,
    last_name: nil,
    email: nil,
    password_hash: nil
  }

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # describe "index" do
  #   test "lists all users", %{conn: conn} do
  #     conn = get(conn, Routes.user_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      response = post(conn, Routes.user_path(conn, :create), user: @create_attrs)

      data = json_response(response, 201)["data"]
      refute data["is_active"]
      assert is_integer(data["id"])
      assert @create_attrs.first_name == data["first_name"]
      assert @create_attrs.last_name == data["last_name"]
      assert @create_attrs.email == data["email"]
      assert data["is_push_notifications_activated"]
      assert data["is_email_notifications_activated"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "show user" do
    test "show user authenticated", %{conn: conn} do
      session = insert(:session)

      response =
        conn
        |> put_req_header("authorization", "Bearer #{session.token}")
        |> get(Routes.user_path(conn, :show))

        data = json_response(response, 200)["data"]
        refute data["is_active"]
        assert is_integer(data["id"])
        assert session.user.first_name == data["first_name"]
        assert session.user.last_name == data["last_name"]
        assert session.user.email == data["email"]
        assert data["is_push_notifications_activated"]
        assert data["is_email_notifications_activated"]
    end
  end

  describe "verify_email/2" do
    test "render success on confirmation account", %{conn: conn} do
      user = fixture(:user)
      token = Vystoria.Auth.get_user_token(user)

      conn =
        conn
        |> put_req_header("accept", "text/html")
        |> get(Routes.user_path(conn, :verify_email, token: token))

      assert html_response(conn, 200) =~ "Conta confirmada!"
    end

    test "render error on confirmation account", %{conn: conn} do
      conn =
        conn
        |> put_req_header("accept", "text/html")
        |> get(Routes.user_path(conn, :verify_email, token: ""))

      assert html_response(conn, 200) =~ "Endereço inválido."
    end
  end

  # describe "update user" do
  #   setup [:create_user]

  #   test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
  #     conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.user_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "email" => "some updated email",
  #              "password_hash" => "some updated password_hash"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, user: user} do
  #     conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete user" do
  #   setup [:create_user]

  #   test "deletes chosen user", %{conn: conn, user: user} do
  #     conn = delete(conn, Routes.user_path(conn, :delete, user))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.user_path(conn, :show, user))
  #     end
  #   end
  # end

  # defp create_user(_) do
  #   user = fixture(:user)
  #   {:ok, user: user}
  # end
end
