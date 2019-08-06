defmodule HububApi.Repo.Migrations.CreateAttendee do
  use Ecto.Migration

  def change do
    create table(:attendee) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:attendee, [:user_id])
  end
end
