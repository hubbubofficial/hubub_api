defmodule HububWeb.UserView do
  use HububWeb, :view

  alias Hubub.Users
  alias Hubub.Users.User
  alias HububWeb.UserView

  def render("index.json", users) do
    render_many(users, UserView, "show.json")
  end

  def render("show.json", %User{} = user) do
    %{
      id: user.id,
      phone: user.phone,
      email: user.email,
      name_first: user.name_first,
      name_last: user.name_last,
      title: user.title,
      inserted_at: user.inserted_at
    }
  end
end
