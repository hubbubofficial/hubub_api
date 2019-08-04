defmodule HububApi.Repo do
  use Ecto.Repo,
    otp_app: :hubub_api,
    adapter: Ecto.Adapters.Postgres
end
