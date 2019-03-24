defmodule VystoriaWeb.PhotoControllerTest do
  use VystoriaWeb.ConnCase
  import Vystoria.Factory

  alias Vystoria.Images
  # alias Vystoria.Images.Photo

  @create_attrs %{
    url: "some url",
    user_id: "some user_id"
  }
  # @update_attrs %{
  #   url: "some updated url",
  #   user_id: "some updated user_id"
  # }
  @invalid_attrs %{url: nil, user_id: nil}

  def fixture(:photo) do
    {:ok, photo} = Images.create_photo(@create_attrs)
    photo
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # describe "index" do
  #   test "lists all photos", %{conn: conn} do
  #     conn = get(conn, Routes.photo_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  describe "create photo" do
    test "renders photo when data is valid", %{conn: conn} do
      session = insert(:session)
      upload = %Plug.Upload{path: "test/fixtures/small.png", filename: "small.png"}

      response =
        conn
        |> put_req_header("authorization", "Bearer #{session.token}")
        |> put_req_header("accept", "text/html")
        |> post(Routes.photo_path(conn, :create), upload: upload)

      data = json_response(response, 201)["data"]
      assert is_integer(data["id"])
      uuid = String.slice(data["url"], 49..84)
      assert Regex.match?(~r/[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}/, uuid)
    end

    # test "renders errors when data is invalid", %{conn: conn} do
    #   conn = post(conn, Routes.photo_path(conn, :create), photo: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  # describe "update photo" do
  #   setup [:create_photo]

  #   test "renders photo when data is valid", %{conn: conn, photo: %Photo{id: id} = photo} do
  #     conn = put(conn, Routes.photo_path(conn, :update, photo), photo: @update_attrs)
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.photo_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "url" => "some updated url",
  #              "user_id" => "some updated user_id"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, photo: photo} do
  #     conn = put(conn, Routes.photo_path(conn, :update, photo), photo: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete photo" do
  #   setup [:create_photo]

  #   test "deletes chosen photo", %{conn: conn, photo: photo} do
  #     conn = delete(conn, Routes.photo_path(conn, :delete, photo))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.photo_path(conn, :show, photo))
  #     end
  #   end
  # end

  # defp create_photo(_) do
  #   photo = fixture(:photo)
  #   {:ok, photo: photo}
  # end
end
