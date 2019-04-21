defmodule DevJutsuWeb.TableController do
  use DevJutsuWeb, :controller

  alias DevJutsu.Tables
  alias DevJutsu.Tables.Table

  def show(conn, %{"id" => id}) do
    table = Tables.get_table!(id)
    render(conn, "show.html", table: table)
  end

  def new(conn, _params) do
    changeset = Tables.change_table(%Table{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"table" => table_params}) do
    case Tables.create_table(table_params) do
      {:ok, table} ->
        conn
        |> put_flash(:info, "Table created successfully.")
        |> redirect(to: Routes.table_path(conn, :show, table))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
