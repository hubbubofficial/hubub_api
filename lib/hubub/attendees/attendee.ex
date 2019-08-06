defmodule Hubub.Attendees.Attendee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attendee" do
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(attendee, attrs) do
    attendee
    |> cast(attrs, [])
    |> validate_required([])
  end
end
