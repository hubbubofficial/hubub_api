defmodule Hubub.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :topic, :string
      add :session_id, references(:sessions, on_delete: :nothing)

      timestamps()
    end

    create index(:topics, [:session_id])
  end
end
