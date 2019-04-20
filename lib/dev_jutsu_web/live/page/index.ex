defmodule DevJutsuWeb.Live.Page.Index do
  use Phoenix.LiveView

  alias DevJutsuWeb.PageView

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, %{})}
  end
end
