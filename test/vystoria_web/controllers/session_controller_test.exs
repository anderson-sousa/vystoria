defmodule VystoriaWeb.SessionControllerTest do
  use VystoriaWeb.ConnCase

  @create_attrs %{
    first_name: "Jose",
    last_name: "Silva",
    email: "jose.silva@email.com",
    password: "supers3cr3t"
  }

  def fixture(:user) do
    {:ok, user} = Vystoria.Accounts.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create session" do
    test "render token for a valid user", %{conn: conn} do
      user = fixture(:user)

      response =
        post(conn, Routes.session_path(conn, :create), %{email: @create_attrs.email, password: @create_attrs.password})

      assert {:ok, user.id} == Vystoria.Auth.Token.verify(json_response(response, 200)["data"]["token"])
    end

    test "render error for an invalid user", %{conn: conn} do
      response = post(conn, Routes.session_path(conn, :create), %{email: @create_attrs.email, password: "blablabla"})

      assert json_response(response, 401)["errors"] == %{"detail" => "Wrong email or password"}
    end
  end

  describe "delete session" do
    test "render 204 when log out from a existent session", %{conn: conn} do
      user = fixture(:user)
      {:ok, session} = Vystoria.Auth.authenticate(user.email, @create_attrs.password)

      response =
        conn
        |> put_req_header("authorization", "Bearer #{session.token}")
        |> delete(Routes.session_path(conn, :delete))

      assert response.status == 204
    end

    test "render 400 when log out from a nonexistent session", %{conn: conn} do
      response =
        conn
        |> put_req_header("authorization", "Bearer blablabla")
        |> delete(Routes.session_path(conn, :delete))

      assert json_response(response, 400) == %{"errors" => %{"detail" => "session invalid"}}
    end

    test "render 400 when log out from a missing authorization header", %{conn: conn} do
      response =
        conn
        |> delete(Routes.session_path(conn, :delete))

      assert json_response(response, 400) == %{"errors" => %{"detail" => "authorization header not present"}}
    end

    test "render 400 when log out from a experid session", %{conn: conn} do
      response =
        conn
        |> put_req_header("authorization", "Bearer")
        |> delete(Routes.session_path(conn, :delete))

      assert json_response(response, 400) == %{"errors" => %{"detail" => "token not found"}}
    end
  end
end
