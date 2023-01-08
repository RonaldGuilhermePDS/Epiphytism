import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :dict_api, DictApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "dict_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dict_api, DictApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Y+5owis01DxVXFf7CGfB7vxBV2cNo+hxe+Sq9ujAfp/HavfQJqqrCM1q7eMr+myW",
  server: false

# In test we don't send emails.
config :dict_api, DictApi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
