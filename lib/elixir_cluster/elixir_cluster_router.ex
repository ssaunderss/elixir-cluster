defmodule ElixirCluster.Router do
  use Plug.Router
  use Plug.Debugger
  use Plug.ErrorHandler

  require Logger

  plug Plug.Logger, log: :debug
  plug :match
  plug :dispatch

  # GOOSE
  get "/" do
    send_resp(conn, 200, "use the /goose endpoint to figure out which node is the goose")
  end

  get "/goose" do
    send_resp(conn, 200, "the current goose is: #todo")
  end

  get "/US1549" do
    send_resp(conn, 200, "current goose has been demised, promoted #todo to goose")
  end

  # post "/post" do
  #   {:ok, body, conn} = read_body(conn)
  #   body = Poison.decode!(body)
  #   IO.inspect(body)
  #   send_resp(conn, 201, "created: #{get_in(body, ["message"])}")
  # end

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
