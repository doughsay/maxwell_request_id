defmodule MaxwellRequestId.Middleware do
  require Logger
  use Maxwell.Middleware
  import Maxwell.Conn, only: [put_req_header: 3]

  def init(opts), do: opts

  def request(conn, opts) do
    header_name = opts[:header_name] || "x-request-id"

    case Logger.metadata[:request_id] do
      nil -> conn
      id  -> put_req_header(conn, header_name, id)
    end
  end
end
