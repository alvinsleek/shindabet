defmodule Shindabet.Repo do
  use Ecto.Repo,
    otp_app: :shindabet,
    adapter: Ecto.Adapters.Postgres
end
