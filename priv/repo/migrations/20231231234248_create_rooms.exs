defmodule Pusher.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :code, :string

      timestamps()
    end

    create index(:rooms, [:code], unique: true, name: :idx_rooms_code)
  end
end
