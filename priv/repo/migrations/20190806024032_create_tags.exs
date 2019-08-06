defmodule Hubub.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag, :string
      add :session_id, references(:sessions, on_delete: :nothing)

      timestamps()
    end

    create index(:tags, [:session_id])
  end
end
