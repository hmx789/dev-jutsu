defmodule DevJutsuWeb.PageController do
  use DevJutsuWeb, :controller

  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, DevJutsuWeb.Live.Page.Index, session: %{})
  end
end
