defmodule DevJutsu.Repo do
  use Ecto.Repo,
    otp_app: :dev_jutsu,
    adapter: Ecto.Adapters.Postgres
end
