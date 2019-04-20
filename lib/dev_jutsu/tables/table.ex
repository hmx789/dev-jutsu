defmodule DevJutsu.Tables.Table do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tables" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  def changeset(table, attrs) do
    table
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

end
