defmodule VystoriaWeb.InspectionController do
  use VystoriaWeb, :controller

  alias Vystoria.Inspections
  alias Vystoria.Inspections.Inspection

  action_fallback VystoriaWeb.FallbackController

  # def index(conn, _params) do
  #   inspections = Inspections.list_inspections()
  #   render(conn, "index.json", inspections: inspections)
  # end

  def create(conn, %{"inspection" => inspection_params}) do
    with {:ok, %Inspection{} = inspection} <- Inspections.create_inspection(conn.assigns.session.user, inspection_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.inspection_path(conn, :show, inspection))
      |> render("show.json", inspection: inspection)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   inspection = Inspections.get_inspection!(id)
  #   render(conn, "show.json", inspection: inspection)
  # end

  # def update(conn, %{"id" => id, "inspection" => inspection_params}) do
  #   inspection = Inspections.get_inspection!(id)

  #   with {:ok, %Inspection{} = inspection} <- Inspections.update_inspection(inspection, inspection_params) do
  #     render(conn, "show.json", inspection: inspection)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   inspection = Inspections.get_inspection!(id)

  #   with {:ok, %Inspection{}} <- Inspections.delete_inspection(inspection) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
