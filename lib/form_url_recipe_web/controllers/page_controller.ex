defmodule FormUrlRecipeWeb.PageController do
  use FormUrlRecipeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
