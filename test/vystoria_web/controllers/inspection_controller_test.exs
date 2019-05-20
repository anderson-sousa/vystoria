defmodule VystoriaWeb.InspectionControllerTest do
  use VystoriaWeb.ConnCase

  alias Vystoria.Inspections
  alias Vystoria.Inspections.Inspection

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:inspection) do
    {:ok, inspection} = Inspections.create_inspection(@create_attrs)
    inspection
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all inspections", %{conn: conn} do
      conn = get(conn, Routes.inspection_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create inspection" do
    test "renders inspection when data is valid", %{conn: conn} do
      conn = post(conn, Routes.inspection_path(conn, :create), inspection: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.inspection_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.inspection_path(conn, :create), inspection: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update inspection" do
    setup [:create_inspection]

    test "renders inspection when data is valid", %{conn: conn, inspection: %Inspection{id: id} = inspection} do
      conn = put(conn, Routes.inspection_path(conn, :update, inspection), inspection: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.inspection_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, inspection: inspection} do
      conn = put(conn, Routes.inspection_path(conn, :update, inspection), inspection: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  # describe "delete inspection" do
  #   setup [:create_inspection]

  #   test "deletes chosen inspection", %{conn: conn, inspection: inspection} do
  #     conn = delete(conn, Routes.inspection_path(conn, :delete, inspection))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.inspection_path(conn, :show, inspection))
  #     end
  #   end
  # end

  defp create_inspection(_) do
    inspection = fixture(:inspection)
    {:ok, inspection: inspection}
  end
end
