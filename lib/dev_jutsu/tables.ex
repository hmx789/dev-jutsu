defmodule DevJutsu.Tables do
  alias DevJutsu.Repo
  alias DevJutsu.Tables.Table

  def get_table!(id), do: Repo.get!(Table, id)

  def change_table(%Table{} = table) do
    Table.changeset(table, %{})
  end

  def create_table(attrs \\ %{}) do
    %Table{}
    |> Table.changeset(attrs)
    |> Repo.insert()
  end
end
