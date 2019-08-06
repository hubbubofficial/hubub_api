defmodule HububApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name_first, :string
      add :name_last, :string
      add :title, :string
      add :email, :string
      add :phone, :string

      timestamps()
    end

  end
end
