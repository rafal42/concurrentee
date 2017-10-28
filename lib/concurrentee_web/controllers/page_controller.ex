defmodule ConcurrenteeWeb.PageController do
  use ConcurrenteeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
