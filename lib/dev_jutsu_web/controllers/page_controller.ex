defmodule DevJutsuWeb.PageController do
  use DevJutsuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
