defmodule DevJutsuWeb.TableControllerTest do
  use DevJutsuWeb.ConnCase, async: true

  @invalid_table_attrs %{}

  describe "new table" do
    test "renders the create table form", %{conn: conn} do
      conn = get(conn, Routes.table_path(conn, :new))
      assert html_response(conn, 200) =~ "Create a table"
    end
  end

  describe "create table" do
    test "redirects to show when data is valid", %{conn: conn} do
      table_attrs = params_for(:table)
      conn = post(conn, Routes.table_path(conn, :create), table: table_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.table_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.table_path(conn, :create), table: @invalid_table_attrs)
      assert html_response(conn, 200) =~ "Create a table"
    end
  end

  describe "show table" do
    setup [:create_table]

    test "shows the table name when the table exists", %{conn: conn, table: table} do
      conn = get(conn, Routes.table_path(conn, :show, table.id))
      assert html_response(conn, 200) =~ table.name
    end

    test "shows the table description when the table exists", %{conn: conn, table: table} do
      conn = get(conn, Routes.table_path(conn, :show, table.id))
      assert html_response(conn, 200) =~ table.description
    end

    test "raises an Ecto.NoResultsError when the table does not exist", %{conn: conn, table: table} do
      assert_raise Ecto.NoResultsError, fn ->
        get(conn, Routes.table_path(conn, :show, 1 + table.id))
      end
    end
  end

  def create_table(_) do
    table = insert(:table)
    {:ok, table: table}
  end
end
