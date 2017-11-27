defmodule Winchester.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Winchester.Repo
    ]

    opts = [strategy: :one_for_one, name: Winchester.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
