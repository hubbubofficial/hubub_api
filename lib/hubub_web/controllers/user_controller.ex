defmodule HububWeb.API.V1.UserController do
  use HububWeb, :controller

  alias Hubub.Users

  def show(conn, %{"id" => user_id}) do
    user = Users.get_user(user_id)

    conn |> render("show.json", user)
  end
end
