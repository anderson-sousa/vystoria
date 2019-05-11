defmodule Vystoria.InspectionsTest do
  use Vystoria.DataCase

  alias Vystoria.Inspections

  describe "inspections" do
    alias Vystoria.Inspections.Inspection

    @valid_attrs %{motivation: "some motivation", status: "some status"}
    @update_attrs %{motivation: "some updated motivation", status: "some updated status"}
    @invalid_attrs %{motivation: nil, status: nil}

    def inspection_fixture(attrs \\ %{}) do
      {:ok, inspection} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inspections.create_inspection()

      inspection
    end

    test "list_inspections/0 returns all inspections" do
      inspection = inspection_fixture()
      assert Inspections.list_inspections() == [inspection]
    end

    test "get_inspection!/1 returns the inspection with given id" do
      inspection = inspection_fixture()
      assert Inspections.get_inspection!(inspection.id) == inspection
    end

    test "create_inspection/1 with valid data creates a inspection" do
      assert {:ok, %Inspection{} = inspection} = Inspections.create_inspection(@valid_attrs)
      assert inspection.motivation == "some motivation"
      assert inspection.status == "some status"
    end

    test "create_inspection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inspections.create_inspection(@invalid_attrs)
    end

    test "update_inspection/2 with valid data updates the inspection" do
      inspection = inspection_fixture()
      assert {:ok, %Inspection{} = inspection} = Inspections.update_inspection(inspection, @update_attrs)
      assert inspection.motivation == "some updated motivation"
      assert inspection.status == "some updated status"
    end

    test "update_inspection/2 with invalid data returns error changeset" do
      inspection = inspection_fixture()
      assert {:error, %Ecto.Changeset{}} = Inspections.update_inspection(inspection, @invalid_attrs)
      assert inspection == Inspections.get_inspection!(inspection.id)
    end

    test "delete_inspection/1 deletes the inspection" do
      inspection = inspection_fixture()
      assert {:ok, %Inspection{}} = Inspections.delete_inspection(inspection)
      assert_raise Ecto.NoResultsError, fn -> Inspections.get_inspection!(inspection.id) end
    end

    test "change_inspection/1 returns a inspection changeset" do
      inspection = inspection_fixture()
      assert %Ecto.Changeset{} = Inspections.change_inspection(inspection)
    end
  end

  describe "places" do
    alias Vystoria.Inspections.Place

    @valid_attrs %{cep: "some cep", city: "some city", complement: "some complement", flors: 42, number: 42, state: "some state", type: "some type"}
    @update_attrs %{cep: "some updated cep", city: "some updated city", complement: "some updated complement", flors: 43, number: 43, state: "some updated state", type: "some updated type"}
    @invalid_attrs %{cep: nil, city: nil, complement: nil, flors: nil, number: nil, state: nil, type: nil}

    def place_fixture(attrs \\ %{}) do
      {:ok, place} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inspections.create_place()

      place
    end

    test "list_places/0 returns all places" do
      place = place_fixture()
      assert Inspections.list_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Inspections.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      assert {:ok, %Place{} = place} = Inspections.create_place(@valid_attrs)
      assert place.cep == "some cep"
      assert place.city == "some city"
      assert place.complement == "some complement"
      assert place.flors == 42
      assert place.number == 42
      assert place.state == "some state"
      assert place.type == "some type"
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inspections.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      assert {:ok, %Place{} = place} = Inspections.update_place(place, @update_attrs)
      assert place.cep == "some updated cep"
      assert place.city == "some updated city"
      assert place.complement == "some updated complement"
      assert place.flors == 43
      assert place.number == 43
      assert place.state == "some updated state"
      assert place.type == "some updated type"
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Inspections.update_place(place, @invalid_attrs)
      assert place == Inspections.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Inspections.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Inspections.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Inspections.change_place(place)
    end
  end

  describe "representatives" do
    alias Vystoria.Inspections.Representative

    @valid_attrs %{address: "some address", cep: "some cep", city: "some city", complement: "some complement", cpf: "some cpf", email: "some email", name: "some name", number: "some number", phone: "some phone", state: "some state", type: "some type"}
    @update_attrs %{address: "some updated address", cep: "some updated cep", city: "some updated city", complement: "some updated complement", cpf: "some updated cpf", email: "some updated email", name: "some updated name", number: "some updated number", phone: "some updated phone", state: "some updated state", type: "some updated type"}
    @invalid_attrs %{address: nil, cep: nil, city: nil, complement: nil, cpf: nil, email: nil, name: nil, number: nil, phone: nil, state: nil, type: nil}

    def representative_fixture(attrs \\ %{}) do
      {:ok, representative} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inspections.create_representative()

      representative
    end

    test "list_representatives/0 returns all representatives" do
      representative = representative_fixture()
      assert Inspections.list_representatives() == [representative]
    end

    test "get_representative!/1 returns the representative with given id" do
      representative = representative_fixture()
      assert Inspections.get_representative!(representative.id) == representative
    end

    test "create_representative/1 with valid data creates a representative" do
      assert {:ok, %Representative{} = representative} = Inspections.create_representative(@valid_attrs)
      assert representative.address == "some address"
      assert representative.cep == "some cep"
      assert representative.city == "some city"
      assert representative.complement == "some complement"
      assert representative.cpf == "some cpf"
      assert representative.email == "some email"
      assert representative.name == "some name"
      assert representative.number == "some number"
      assert representative.phone == "some phone"
      assert representative.state == "some state"
      assert representative.type == "some type"
    end

    test "create_representative/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inspections.create_representative(@invalid_attrs)
    end

    test "update_representative/2 with valid data updates the representative" do
      representative = representative_fixture()
      assert {:ok, %Representative{} = representative} = Inspections.update_representative(representative, @update_attrs)
      assert representative.address == "some updated address"
      assert representative.cep == "some updated cep"
      assert representative.city == "some updated city"
      assert representative.complement == "some updated complement"
      assert representative.cpf == "some updated cpf"
      assert representative.email == "some updated email"
      assert representative.name == "some updated name"
      assert representative.number == "some updated number"
      assert representative.phone == "some updated phone"
      assert representative.state == "some updated state"
      assert representative.type == "some updated type"
    end

    test "update_representative/2 with invalid data returns error changeset" do
      representative = representative_fixture()
      assert {:error, %Ecto.Changeset{}} = Inspections.update_representative(representative, @invalid_attrs)
      assert representative == Inspections.get_representative!(representative.id)
    end

    test "delete_representative/1 deletes the representative" do
      representative = representative_fixture()
      assert {:ok, %Representative{}} = Inspections.delete_representative(representative)
      assert_raise Ecto.NoResultsError, fn -> Inspections.get_representative!(representative.id) end
    end

    test "change_representative/1 returns a representative changeset" do
      representative = representative_fixture()
      assert %Ecto.Changeset{} = Inspections.change_representative(representative)
    end
  end

  describe "environments" do
    alias Vystoria.Inspections.Environment

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def environment_fixture(attrs \\ %{}) do
      {:ok, environment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inspections.create_environment()

      environment
    end

    test "list_environments/0 returns all environments" do
      environment = environment_fixture()
      assert Inspections.list_environments() == [environment]
    end

    test "get_environment!/1 returns the environment with given id" do
      environment = environment_fixture()
      assert Inspections.get_environment!(environment.id) == environment
    end

    test "create_environment/1 with valid data creates a environment" do
      assert {:ok, %Environment{} = environment} = Inspections.create_environment(@valid_attrs)
      assert environment.name == "some name"
    end

    test "create_environment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inspections.create_environment(@invalid_attrs)
    end

    test "update_environment/2 with valid data updates the environment" do
      environment = environment_fixture()
      assert {:ok, %Environment{} = environment} = Inspections.update_environment(environment, @update_attrs)
      assert environment.name == "some updated name"
    end

    test "update_environment/2 with invalid data returns error changeset" do
      environment = environment_fixture()
      assert {:error, %Ecto.Changeset{}} = Inspections.update_environment(environment, @invalid_attrs)
      assert environment == Inspections.get_environment!(environment.id)
    end

    test "delete_environment/1 deletes the environment" do
      environment = environment_fixture()
      assert {:ok, %Environment{}} = Inspections.delete_environment(environment)
      assert_raise Ecto.NoResultsError, fn -> Inspections.get_environment!(environment.id) end
    end

    test "change_environment/1 returns a environment changeset" do
      environment = environment_fixture()
      assert %Ecto.Changeset{} = Inspections.change_environment(environment)
    end
  end

  describe "items" do
    alias Vystoria.Inspections.Item

    @valid_attrs %{description: "some description", name: "some name", state: "some state"}
    @update_attrs %{description: "some updated description", name: "some updated name", state: "some updated state"}
    @invalid_attrs %{description: nil, name: nil, state: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inspections.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Inspections.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Inspections.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Inspections.create_item(@valid_attrs)
      assert item.description == "some description"
      assert item.name == "some name"
      assert item.state == "some state"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inspections.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Inspections.update_item(item, @update_attrs)
      assert item.description == "some updated description"
      assert item.name == "some updated name"
      assert item.state == "some updated state"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inspections.update_item(item, @invalid_attrs)
      assert item == Inspections.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Inspections.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Inspections.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Inspections.change_item(item)
    end
  end
end
