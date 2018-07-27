defmodule MaxwellRequestId.Mixfile do
  use Mix.Project

  def project do
    [
      app: :maxwell_request_id,
      version: "0.2.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ],
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp description do
    """
    Maxwell middleware for adding x-request-id to outgoing requests
    """
  end

  defp package do
    [
      maintainers: ["Chris Dosé <chris.dose@gmail.com>"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/doughsay/maxwell_request_id"
      }
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.9", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.6", only: :test},
      {:maxwell, ">= 2.2.0"}
    ]
  end
end
