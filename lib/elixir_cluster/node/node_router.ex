defmodule ElixirCluster.NodeRouter do
  use Plug.Router
  use Plug.Debugger
  use Plug.ErrorHandler

  require Logger

  plug Plug.Logger, log: :debug
  plug :match
  plug :dispatch

  # returns the status of the node - i.e. whether this node is a goose or a duck
  get "/status" do
    #todo: call to genserver that returns what the status is
    send_resp(conn, 200, "use the /goose endpoint to figure out which node is the goose")
  end

  match _ do
    send_resp(conn, 404, "Page not found")
  end

  defp handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something\'s not right here...")
  end
end
