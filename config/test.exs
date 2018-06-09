use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sales_loft_code_exercise, SalesLoftCodeExerciseWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :sales_loft_code_exercise, SalesLoftCodeExercise.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "sales_loft_code_exercise_test",
  hostname: "localhost"

#  pool: Ecto.Adapters.SQL.Sandbox
