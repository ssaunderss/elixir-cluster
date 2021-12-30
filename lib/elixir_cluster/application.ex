defmodule ElixirCluster.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: ElixirCluster.Router, options: [port: cowboy_port()]}
      # Starts a worker by calling: ElixirCluster.Worker.start_link(arg)
      # {ElixirCluster.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirCluster.Supervisor]

    Logger.info("Starting duck duck goose...")
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:elixir_cluster, :cowboy_port, 7777)
end
