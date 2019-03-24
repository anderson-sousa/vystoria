defmodule Vystoria.ImagesTest do
  use Vystoria.DataCase

  alias Vystoria.Images

  describe "photos" do
    alias Vystoria.Images.Photo

    @valid_attrs %{url: "some url", user_id: "some user_id"}
    @update_attrs %{url: "some updated url", user_id: "some updated user_id"}
    @invalid_attrs %{url: nil, user_id: nil}

    def photo_fixture(attrs \\ %{}) do
      user = user_fixture()

      {:ok, photo} =
        attrs
        |> Enum.into(Map.put(@valid_attrs, :user_id, user.id))
        |> Images.create_photo()

      photo
    end

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(%{
          first_name: "Jose",
          last_name: "Silva",
          email: "jose.silva.#{Enum.random(1..1_000)}@email.com",
          password: "supers3cr3t"
        })
        |> Vystoria.Accounts.create_user()

      user
    end

    test "list_photos/0 returns all photos" do
      photo = photo_fixture()
      assert Images.list_photos() == [photo]
    end

    test "get_photo!/1 returns the photo with given id" do
      photo = photo_fixture()
      assert Images.get_photo!(photo.id) == photo
    end

    test "create_photo/1 with valid data creates a photo" do
      user = user_fixture()
      assert {:ok, %Photo{} = photo} = Images.create_photo(Map.put(@valid_attrs, :user_id, user.id))
      assert photo.url == "some url"
      assert photo.user_id == user.id
    end

    test "create_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Images.create_photo(@invalid_attrs)
    end

    test "update_photo/2 with valid data updates the photo" do
      photo = photo_fixture()
      user = user_fixture()
      assert {:ok, %Photo{} = photo} = Images.update_photo(photo, Map.put(@update_attrs, :user_id, user.id))
      assert photo.url == "some updated url"
      assert photo.user_id == user.id
    end

    test "update_photo/2 with invalid data returns error changeset" do
      photo = photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Images.update_photo(photo, @invalid_attrs)
      assert photo == Images.get_photo!(photo.id)
    end

    test "delete_photo/1 deletes the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{}} = Images.delete_photo(photo)
      assert_raise Ecto.NoResultsError, fn -> Images.get_photo!(photo.id) end
    end

    test "change_photo/1 returns a photo changeset" do
      photo = photo_fixture()
      assert %Ecto.Changeset{} = Images.change_photo(photo)
    end
  end
end
