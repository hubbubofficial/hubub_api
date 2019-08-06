defmodule HububApi.AttendeesTest do
  use HububApi.DataCase

  alias HububApi.Attendees

  describe "attendee" do
    alias HububApi.Attendees.Attendee

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def attendee_fixture(attrs \\ %{}) do
      {:ok, attendee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Attendees.create_attendee()

      attendee
    end

    test "list_attendee/0 returns all attendee" do
      attendee = attendee_fixture()
      assert Attendees.list_attendee() == [attendee]
    end

    test "get_attendee!/1 returns the attendee with given id" do
      attendee = attendee_fixture()
      assert Attendees.get_attendee!(attendee.id) == attendee
    end

    test "create_attendee/1 with valid data creates a attendee" do
      assert {:ok, %Attendee{} = attendee} = Attendees.create_attendee(@valid_attrs)
    end

    test "create_attendee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attendees.create_attendee(@invalid_attrs)
    end

    test "update_attendee/2 with valid data updates the attendee" do
      attendee = attendee_fixture()
      assert {:ok, %Attendee{} = attendee} = Attendees.update_attendee(attendee, @update_attrs)
    end

    test "update_attendee/2 with invalid data returns error changeset" do
      attendee = attendee_fixture()
      assert {:error, %Ecto.Changeset{}} = Attendees.update_attendee(attendee, @invalid_attrs)
      assert attendee == Attendees.get_attendee!(attendee.id)
    end

    test "delete_attendee/1 deletes the attendee" do
      attendee = attendee_fixture()
      assert {:ok, %Attendee{}} = Attendees.delete_attendee(attendee)
      assert_raise Ecto.NoResultsError, fn -> Attendees.get_attendee!(attendee.id) end
    end

    test "change_attendee/1 returns a attendee changeset" do
      attendee = attendee_fixture()
      assert %Ecto.Changeset{} = Attendees.change_attendee(attendee)
    end
  end
end
