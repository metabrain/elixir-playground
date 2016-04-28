defmodule ExCollections.Mixfile do
  use Mix.Project

  def project do
    [app: :excollections,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: package,
     description: description]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  defp description do
    """
    A collection of data-structures and related algorithms for Elixir, implemented in Elixir.
    """
  end

  defp package do
    [# These are the default files included in the package
     #files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
    maintainers: ["Daniel Parreira"],
    licenses: ["MIT License"],
    links: %{"GitHub" => "https://github.com/metabrain/elixir-playground/tree/master/excollections"}
    ]
  end
end
