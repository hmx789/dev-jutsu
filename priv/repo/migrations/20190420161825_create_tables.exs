defmodule DevJutsu.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:tables) do
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:tables, [:name])
  end
end
