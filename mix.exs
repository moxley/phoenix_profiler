defmodule PhoenixWeb.Profiler.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :phoenix_web_profiler,
      version: @version,
      elixir: "~> 1.10",
      compilers: [:phoenix] ++ Mix.compilers(),
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      deps: deps(),
      docs: docs(),
      homepage_url: "https://github.com/mcrumm/phoenix_web_profiler",
      description: "Phoenix Web Profiler & Debug Toolbar",
      aliases: aliases()
    ]
  end

  defp elixirc_paths(:dev), do: ["lib", "dev"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger],
      mod: {PhoenixWeb.Profiler.Application, []}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"],
      dev: "run --no-halt dev.exs"
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_live_view, "~> 0.14"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:plug_cowboy, "~> 2.0", only: :dev},
      {:jason, "~> 1.0", only: [:dev, :test, :docs]},
      {:ex_doc, "~> 0.25", only: :docs},
      {:esbuild, "~> 0.2", runtime: Mix.env() == :dev}
    ]
  end

  defp docs do
    [
      main: "PhoenixWeb.Profiler",
      source_ref: "v#{@version}",
      source_url: "https://github.com/mcrumm/phoenix_web_profiler"
    ]
  end

  defp package do
    [
      maintainers: ["Michael Allen Crumm Jr."],
      licenses: ["MIT"],
      links: %{github: "https://github.com/mcrumm/phoenix_web_profiler"},
      files: ~w(lib priv CHANGELOG.md LICENSE mix.exs README.md)
    ]
  end
end
