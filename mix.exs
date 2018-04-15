defmodule Animation.MixProject do
  use Mix.Project

  def project do
    [
      app: :animation,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [ applications: [:logger]]
  end


  defp escript do
    [main_module: Main,
     emu_args: "-noinput -elixir ansi_enabled true"]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bunt, "~> 0.1.0"}
    ]
  end
end
