defmodule AlbionsimWeb.ResourceView do
  use AlbionsimWeb, :view
  alias AlbionsimWeb.ResourceView

  def render("index.json", %{resources: resources}) do
    %{data: render_many(resources, ResourceView, "resource.json")}
  end

  def render("show.json", %{resource: resource}) do
    %{data: render_one(resource, ResourceView, "resource.json")}
  end

  def render("resource.json", %{resource: resource}) do
    %{id: resource.id,
      unique_name: resource.unique_name,
      meta: resource.meta}
  end
end
