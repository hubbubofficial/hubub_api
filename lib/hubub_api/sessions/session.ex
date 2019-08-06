defmodule HububApi.Sessions.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :email, :string
    field :end_date, :utc_datetime
    field :name_last, :string
    field :phone, :string
    field :start_date, :utc_datetime
    field :title, :string
    field :host_id, :id

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:name_last, :title, :email, :phone, :start_date, :end_date])
    |> validate_required([:name_last, :title, :email, :phone, :start_date, :end_date])
  end
end
