defmodule SalesLoftCodeExerciseWeb.PageController do
  use SalesLoftCodeExerciseWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
