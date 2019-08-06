defmodule HububApi.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :name_last, :string
      add :title, :string
      add :email, :string
      add :phone, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :host_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:sessions, [:host_id])
  end
end
