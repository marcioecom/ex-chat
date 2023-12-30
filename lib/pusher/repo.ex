defmodule Pusher.Repo do
  use Ecto.Repo,
    otp_app: :pusher,
    adapter: Ecto.Adapters.Postgres
end
