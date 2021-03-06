defmodule JSON.LD.Mixfile do
  use Mix.Project

  @repo_url "https://github.com/marcelotto/jsonld-ex"

  @version File.read!("VERSION") |> String.trim

  def project do
    [
      app: :json_ld,
      version: @version,
      elixir: "~> 1.6",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # Hex
      package: package(),
      description: description(),

      # Docs
      name: "JSON-LD.ex",
      docs: [
        main: "JSON.LD",
        source_url: @repo_url,
        source_ref: "v#{@version}",
        extras: ["README.md"],
      ],

      # ExCoveralls
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
    ]
  end

  defp description do
    """
    An implementation of JSON-LD for Elixir and RDF.ex.
    """
  end

  defp package do
    [
      maintainers: ["Marcel Otto"],
      licenses: ["MIT"],
      links: %{"GitHub" => @repo_url},
      files: ~w[lib mix.exs README.md LICENSE.md VERSION]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:rdf, "~> 0.5"},
      {:jason, "~> 1.1.1"},
      {:dialyxir, "~> 0.5",     only: [:dev, :test], runtime: false},
      {:credo, "~> 1.1",        only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21",      only: :dev, runtime: false},
      {:excoveralls, "~> 0.11", only: :test},
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
end
