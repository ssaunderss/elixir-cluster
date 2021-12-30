# todo:
# dynamically create and add genservers/respective http servers to the supervision tree

defmodule NodeSupervisor do
  def create_nodes do
    n_nodes = Application.get_env(:elixir_cluster, :n_nodes, 5)
  end
end
