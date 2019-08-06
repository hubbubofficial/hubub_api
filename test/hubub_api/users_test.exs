defmodule HububApi.UsersTest do
  use HububApi.DataCase

  alias HububApi.Users

  describe "users" do
    alias HububApi.Users.User

    @valid_attrs %{email: "some email", name_first: "some name_first", name_last: "some name_last", phone: "some phone", title: "some title"}
    @update_attrs %{email: "some updated email", name_first: "some updated name_first", name_last: "some updated name_last", phone: "some updated phone", title: "some updated title"}
    @invalid_attrs %{email: nil, name_first: nil, name_last: nil, phone: nil, title: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name_first == "some name_first"
      assert user.name_last == "some name_last"
      assert user.phone == "some phone"
      assert user.title == "some title"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name_first == "some updated name_first"
      assert user.name_last == "some updated name_last"
      assert user.phone == "some updated phone"
      assert user.title == "some updated title"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
