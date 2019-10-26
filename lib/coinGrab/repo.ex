defmodule CoinGrab.Repo do
  use Ecto.Repo,
    otp_app: :coinGrab,
    adapter: Ecto.Adapters.Postgres
end
