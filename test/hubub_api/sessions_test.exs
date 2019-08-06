defmodule HububApi.SessionsTest do
  use HububApi.DataCase

  alias HububApi.Sessions

  describe "sessions" do
    alias HububApi.Sessions.Session

    @valid_attrs %{email: "some email", end_date: "2010-04-17T14:00:00Z", name_last: "some name_last", phone: "some phone", start_date: "2010-04-17T14:00:00Z", title: "some title"}
    @update_attrs %{email: "some updated email", end_date: "2011-05-18T15:01:01Z", name_last: "some updated name_last", phone: "some updated phone", start_date: "2011-05-18T15:01:01Z", title: "some updated title"}
    @invalid_attrs %{email: nil, end_date: nil, name_last: nil, phone: nil, start_date: nil, title: nil}

    def session_fixture(attrs \\ %{}) do
      {:ok, session} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sessions.create_session()

      session
    end

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Sessions.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Sessions.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      assert {:ok, %Session{} = session} = Sessions.create_session(@valid_attrs)
      assert session.email == "some email"
      assert session.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert session.name_last == "some name_last"
      assert session.phone == "some phone"
      assert session.start_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert session.title == "some title"
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sessions.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      assert {:ok, %Session{} = session} = Sessions.update_session(session, @update_attrs)
      assert session.email == "some updated email"
      assert session.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert session.name_last == "some updated name_last"
      assert session.phone == "some updated phone"
      assert session.start_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert session.title == "some updated title"
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Sessions.update_session(session, @invalid_attrs)
      assert session == Sessions.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Sessions.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Sessions.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Sessions.change_session(session)
    end
  end
end
