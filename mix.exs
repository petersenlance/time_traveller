defmodule TimeTraveller.MixProject do
  use Mix.Project

  def project do
    [
      app: :time_traveller,
      version: "0.1.0",
      elixir: "~> 1.7.2",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [
        :timex
      ],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:timex, "~> 3.3"},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end

  defp description() do
    """
    Library for easily converting between local time and UTC.
    """
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Lance Petersen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/petersenlance/time_traveller"}
    ]
  end
end
