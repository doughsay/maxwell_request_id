defmodule MaxwellRequestId.Mixfile do
  use Mix.Project

  def project do
    [app: :maxwell_request_id,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
     {:excoveralls, "~> 0.6", only: :test},
     {:maxwell, ">= 2.2.0"}]
  end

  defp description do
    """
    Maxwell middleware for adding x-request-id to outgoing requests.

    It takes the :request_id property from the Logger metadata and passes it on
    under the x-request-id header in outgoing http requests made through maxwell.
    """
  end

  defp package do
    [maintainers: ["Chris Dosé <chris.dose@gmail.com>"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/doughsay/maxwell_request_id",
              "Docs" => "https://hexdocs.pm/maxwell_request_id"}]
  end
end
