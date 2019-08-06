defmodule Hubub.Repo do
  use Ecto.Repo,
    otp_app: :hubub,
    adapter: Ecto.Adapters.Postgres
end
