defmodule HububApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name_first, :string
    field :name_last, :string
    field :phone, :string
    field :title, :string

    timestamps()
  end

  @req_fields [:name_first, :name_last, :title, :email, :phone]

  @opt_fields []

  @all_fields @req_fields ++ @opt_fields

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @all_attr)
    |> validate_required(@req_attr)
  end
end
