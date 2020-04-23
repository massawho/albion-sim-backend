defmodule Albionsim.Repo do
  use Ecto.Repo,
    otp_app: :albionsim,
    adapter: Ecto.Adapters.Postgres
end
