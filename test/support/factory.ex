defmodule DevJutsu.Factory do
  use ExMachina.Ecto, repo: DevJutsu.Repo

  def table_factory do
    %DevJutsu.Tables.Table{
      name: sequence(:name, &"table-#{&1}-name"),
      description: sequence(:description, &"table-#{&1}-description")
    }
  end
end
