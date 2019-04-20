# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dev_jutsu,
  ecto_repos: [DevJutsu.Repo]

# Configures the endpoint
config :dev_jutsu, DevJutsuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "65IMkp9klomzs3R8GIUZ21ow6jv9svah1uAR/YaB3TFKyETEq8cVQHi/coF0OZ2I",
  render_errors: [view: DevJutsuWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DevJutsu.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"