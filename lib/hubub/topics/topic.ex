defmodule Hubub.Topics.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :topic, :string
    field :session_id, :id

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:topic])
    |> validate_required([:topic])
  end
end
