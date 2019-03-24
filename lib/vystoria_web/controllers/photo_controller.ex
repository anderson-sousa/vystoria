defmodule VystoriaWeb.PhotoController do
  use VystoriaWeb, :controller
  alias Vystoria.Images

  # alias Vystoria.Images
  # alias Vystoria.Images.Photo

  action_fallback VystoriaWeb.FallbackController

  # def index(conn, _params) do
  #   photos = Images.list_photos()
  #   render(conn, "index.json", photos: photos)
  # end

  def create(conn, %{"upload" => upload}) do
    # Prepar filename
    ext = Path.extname(upload.filename)
    uuid = Ecto.UUID.generate()
    filename = uuid <> ext

    # Send to s3
    {:ok, _} =
      ExAws.S3.put_object(Atom.to_string(Mix.env()), filename, upload.path)
      |> ExAws.request()

    # Save entity
    photo_params = %{
      url: "https://s3-sa-east-1.amazonaws.com/vystoria/#{Atom.to_string(Mix.env())}/#{filename}",
      user_id: conn.assigns.session.user.id
    }

    with {:ok, %Images.Photo{} = photo} <- Images.create_photo(photo_params) do
      conn
      |> put_status(:created)
      |> render("show.json", photo: photo)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   photo = Images.get_photo!(id)
  #   render(conn, "show.json", photo: photo)
  # end

  # def update(conn, %{"id" => id, "photo" => photo_params}) do
  #   photo = Images.get_photo!(id)

  #   with {:ok, %Photo{} = photo} <- Images.update_photo(photo, photo_params) do
  #     render(conn, "show.json", photo: photo)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   photo = Images.get_photo!(id)

  #   with {:ok, %Photo{}} <- Images.delete_photo(photo) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
