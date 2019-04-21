defmodule DevJutsu.Tables.TableTest do
  use DevJutsu.DataCase, async: true

  alias DevJutsu.Tables.Table

  describe "changeset" do
    test "name must be included" do
      {:error, changeset} =
        %Table{}
        |> Table.changeset(%{})
        |> Repo.insert()

      assert %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "name must be unique" do
      table = insert(:table)

      {:error, changeset} =
        %Table{}
        |> Table.changeset(%{name: table.name})
        |> Repo.insert()

      assert %{name: ["has already been taken"]} = errors_on(changeset)
    end
  end
end
