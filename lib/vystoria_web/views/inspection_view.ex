defmodule VystoriaWeb.InspectionView do
  use VystoriaWeb, :view
  alias VystoriaWeb.InspectionView

  def render("index.json", %{inspections: inspections}) do
    %{data: render_many(inspections, InspectionView, "inspection.json")}
  end

  def render("show.json", %{inspection: inspection}) do
    %{data: render_one(inspection, InspectionView, "inspection.json")}
  end

  def render("inspection.json", %{inspection: inspection}) do
    %{id: inspection.id}
  end
end
