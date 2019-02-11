defmodule VystoriaWeb.HelloViewTest do
  use VystoriaWeb.ConnCase, async: true
  use ExUnit.Case

  test "GET /api/v1" do
    conn = get(build_conn(), "/api/v1")

    assert conn.state == :sent
    assert conn.status == 200

    assert json_response(conn, 200)["hello"] == "world"
  end
end
