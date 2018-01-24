defmodule Winchester.Mixfile do
  use Mix.Project

  def project do
    [
      app: :winchester,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Winchester.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto, "~> 2.0"},
      {:mariaex, ">= 0.8.3"}
    ]
  end
end
