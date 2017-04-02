defmodule MaxwellRequestId.Mixfile do
  use Mix.Project

  def project do
    [app: :maxwell_request_id,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:maxwell, "~> 2"}]
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
     links: %{"GitHub" => "https://github.com/doughsay/maxwell_request_id"}]
  end
end
