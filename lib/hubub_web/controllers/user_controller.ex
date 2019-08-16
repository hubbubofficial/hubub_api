defmodule HububWeb.API.V1.UserController do
  use HububWeb, :controller

  alias Hubub.Users

  def show(conn, %{"id" => user_id}) do
    user = Users.get_user!(user_id)

    conn |> render("show.json", user)
  end

  def update(conn, %{"id" => user_id} = params) do
    user = Users.get_user!(user_id)

    updated_user = Users.update_user(user, params)

    conn |> render("show.json", updated_user)
  end

  def create(conn, params) do
    new_user = params |> Users.create_user()

    conn |> render("show.json", new_user)
  end

  def delete(conn, %{"id" => user_id}) do
    user = Users.get_user!(user_id)

    user |> Users.delete_user()

    conn |> render("show.json", user)
  end
end
