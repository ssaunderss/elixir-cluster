defmodule ElixirCluster.NodeServer do
  use GenServer

  def start_link(node_status) do
    GenServer.start_link(__MODULE__, node_status)
  end

  @impl true
  def init(status) do
    {:ok, status}
  end

  # @doc """
  # Turns this node into a Goose
  # """
  # @impl true
  # def handle_call(:goose, _from, node_status = %{node_num, _current_status}) do
  #   {:reply, }
  # end
end

# Node.set_cookie()
