defmodule MaxwellRequestId.Middleware do
  @moduledoc """
  Maxwell middleware for adding x-request-id to outgoing requests.

  It takes the `:request_id` property from the Logger metadata and passes it on under the `x-request-id` header in
  outgoing http requests made through maxwell.

  ### Example usage
  ```
  defmodule MyClient do
    use Maxwell.Builder, ~w(get)a
    middleware MaxwellRequestId.Middleware
  end
  ```

  ### Options

  - `:header_name` - the name of the header to use for outgoing requests (optional)
  """

  require Logger
  use Maxwell.Middleware
  import Maxwell.Conn, only: [put_req_header: 3]

  def init(opts), do: opts

  def request(conn, opts) do
    header_name = opts[:header_name] || "x-request-id"

    case Logger.metadata()[:request_id] do
      nil -> conn
      id -> put_req_header(conn, header_name, id)
    end
  end
end
