defmodule DevJutsu.TablesTest do
  use DevJutsu.DataCase, async: true

  alias DevJutsu.Tables
  alias DevJutsu.Tables.Table

  describe "tables" do
    test "get_table!/1 returns the table with given id" do
      table = insert(:table)
      assert Tables.get_table!(table.id) == table
    end

    test "get_table!/1 raises an Ecto.NoResultsError when it cannot find a matching table" do
      table = insert(:table)

      assert_raise Ecto.NoResultsError, fn ->
        Tables.get_table!(1 + table.id)
      end
    end

    test "change_table/1 returns a table changeset" do
      table = insert(:table)
      assert %Ecto.Changeset{} = Tables.change_table(table)
    end

    test "create_table/1 with valid data creates a table" do
      table_params = params_for(:table)
      assert {:ok, %Table{} = table} = Tables.create_table(table_params)
      assert table.name == table_params[:name]
      assert table.description == table_params[:description]
    end

    test "create_table/1 with invalid data returns an error changeset" do
      table_params = %{}
      assert {:error, %Ecto.Changeset{}} = Tables.create_table(table_params)
    end
  end
end
