defmodule Vystoria.Inspections do
  @moduledoc """
  The Inspections context.
  """

  import Ecto.Query, warn: false
  alias Vystoria.Repo

  alias Vystoria.Inspections.Inspection

  @doc """
  Returns the list of inspections.

  ## Examples

      iex> list_inspections()
      [%Inspection{}, ...]

  """
  def list_inspections do
    Repo.all(Inspection)
  end

  @doc """
  Gets a single inspection.

  Raises `Ecto.NoResultsError` if the Inspection does not exist.

  ## Examples

      iex> get_inspection!(123)
      %Inspection{}

      iex> get_inspection!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inspection!(id), do: Repo.get!(Inspection, id)

  @doc """
  Creates a inspection.

  ## Examples

      iex> create_inspection(%{field: value})
      {:ok, %Inspection{}}

      iex> create_inspection(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inspection(attrs \\ %{}) do
    %Inspection{}
    |> Inspection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inspection.

  ## Examples

      iex> update_inspection(inspection, %{field: new_value})
      {:ok, %Inspection{}}

      iex> update_inspection(inspection, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inspection(%Inspection{} = inspection, attrs) do
    inspection
    |> Inspection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Inspection.

  ## Examples

      iex> delete_inspection(inspection)
      {:ok, %Inspection{}}

      iex> delete_inspection(inspection)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inspection(%Inspection{} = inspection) do
    Repo.delete(inspection)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inspection changes.

  ## Examples

      iex> change_inspection(inspection)
      %Ecto.Changeset{source: %Inspection{}}

  """
  def change_inspection(%Inspection{} = inspection) do
    Inspection.changeset(inspection, %{})
  end

  alias Vystoria.Inspections.Place

  @doc """
  Returns the list of places.

  ## Examples

      iex> list_places()
      [%Place{}, ...]

  """
  def list_places do
    Repo.all(Place)
  end

  @doc """
  Gets a single place.

  Raises `Ecto.NoResultsError` if the Place does not exist.

  ## Examples

      iex> get_place!(123)
      %Place{}

      iex> get_place!(456)
      ** (Ecto.NoResultsError)

  """
  def get_place!(id), do: Repo.get!(Place, id)

  @doc """
  Creates a place.

  ## Examples

      iex> create_place(%{field: value})
      {:ok, %Place{}}

      iex> create_place(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_place(attrs \\ %{}) do
    %Place{}
    |> Place.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a place.

  ## Examples

      iex> update_place(place, %{field: new_value})
      {:ok, %Place{}}

      iex> update_place(place, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_place(%Place{} = place, attrs) do
    place
    |> Place.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Place.

  ## Examples

      iex> delete_place(place)
      {:ok, %Place{}}

      iex> delete_place(place)
      {:error, %Ecto.Changeset{}}

  """
  def delete_place(%Place{} = place) do
    Repo.delete(place)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking place changes.

  ## Examples

      iex> change_place(place)
      %Ecto.Changeset{source: %Place{}}

  """
  def change_place(%Place{} = place) do
    Place.changeset(place, %{})
  end

  alias Vystoria.Inspections.Representative

  @doc """
  Returns the list of representatives.

  ## Examples

      iex> list_representatives()
      [%Representative{}, ...]

  """
  def list_representatives do
    Repo.all(Representative)
  end

  @doc """
  Gets a single representative.

  Raises `Ecto.NoResultsError` if the Representative does not exist.

  ## Examples

      iex> get_representative!(123)
      %Representative{}

      iex> get_representative!(456)
      ** (Ecto.NoResultsError)

  """
  def get_representative!(id), do: Repo.get!(Representative, id)

  @doc """
  Creates a representative.

  ## Examples

      iex> create_representative(%{field: value})
      {:ok, %Representative{}}

      iex> create_representative(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_representative(attrs \\ %{}) do
    %Representative{}
    |> Representative.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a representative.

  ## Examples

      iex> update_representative(representative, %{field: new_value})
      {:ok, %Representative{}}

      iex> update_representative(representative, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_representative(%Representative{} = representative, attrs) do
    representative
    |> Representative.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Representative.

  ## Examples

      iex> delete_representative(representative)
      {:ok, %Representative{}}

      iex> delete_representative(representative)
      {:error, %Ecto.Changeset{}}

  """
  def delete_representative(%Representative{} = representative) do
    Repo.delete(representative)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking representative changes.

  ## Examples

      iex> change_representative(representative)
      %Ecto.Changeset{source: %Representative{}}

  """
  def change_representative(%Representative{} = representative) do
    Representative.changeset(representative, %{})
  end

  alias Vystoria.Inspections.Environment

  @doc """
  Returns the list of environments.

  ## Examples

      iex> list_environments()
      [%Environment{}, ...]

  """
  def list_environments do
    Repo.all(Environment)
  end

  @doc """
  Gets a single environment.

  Raises `Ecto.NoResultsError` if the Environment does not exist.

  ## Examples

      iex> get_environment!(123)
      %Environment{}

      iex> get_environment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_environment!(id), do: Repo.get!(Environment, id)

  @doc """
  Creates a environment.

  ## Examples

      iex> create_environment(%{field: value})
      {:ok, %Environment{}}

      iex> create_environment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_environment(attrs \\ %{}) do
    %Environment{}
    |> Environment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a environment.

  ## Examples

      iex> update_environment(environment, %{field: new_value})
      {:ok, %Environment{}}

      iex> update_environment(environment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_environment(%Environment{} = environment, attrs) do
    environment
    |> Environment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Environment.

  ## Examples

      iex> delete_environment(environment)
      {:ok, %Environment{}}

      iex> delete_environment(environment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_environment(%Environment{} = environment) do
    Repo.delete(environment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking environment changes.

  ## Examples

      iex> change_environment(environment)
      %Ecto.Changeset{source: %Environment{}}

  """
  def change_environment(%Environment{} = environment) do
    Environment.changeset(environment, %{})
  end

  alias Vystoria.Inspections.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{source: %Item{}}

  """
  def change_item(%Item{} = item) do
    Item.changeset(item, %{})
  end
end
