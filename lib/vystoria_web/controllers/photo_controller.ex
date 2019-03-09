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

  def create(conn, %{"file" => image_base64}) do
    # Decode the image
    {:ok, image_binary} = Base.decode64(image_base64)

    # Generate a unique filename
    filename =
      image_binary
      |> image_extension()
      |> unique_filename()

    # Send to s3
    {:ok, _} =
      ExAws.S3.put_object(Atom.to_string(Mix.env()), filename, image_binary)
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

  # Generates a unique filename with a given extension
  defp unique_filename(extension) do
    Ecto.UUID.generate() <> extension
  end

  # Helper functions to read the binary to determine the image extension
  defp image_extension(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>), do: ".png"
  defp image_extension(<<0xff, 0xD8, _::binary>>), do: ".jpg"

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
