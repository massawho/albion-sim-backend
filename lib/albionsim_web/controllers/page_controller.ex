defmodule AlbionsimWeb.PageController do
  use AlbionsimWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
