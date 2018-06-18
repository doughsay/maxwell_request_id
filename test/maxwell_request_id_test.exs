defmodule MaxwellRequestIdTest do
  use ExUnit.Case
  doctest MaxwellRequestId

  setup do
    %{conn: %Maxwell.Conn{}}
  end

  test "with no request_id", %{conn: conn} do
    conn = MaxwellRequestId.Middleware.request(conn, [])
    assert conn.req_headers[:request_id] == nil
  end

  test "with a request_id", %{conn: conn} do
    Logger.metadata(request_id: "123456789")
    conn = MaxwellRequestId.Middleware.request(conn, [])
    assert conn.req_headers["x-request-id"] == "123456789"
  end

  test "overriding the header name", %{conn: conn} do
    Logger.metadata(request_id: "123456789")
    conn = MaxwellRequestId.Middleware.request(conn, header_name: "x-transaction-id")
    assert conn.req_headers["x-transaction-id"] == "123456789"
  end

  test "options" do
    assert MaxwellRequestId.Middleware.init([]) == []
    assert MaxwellRequestId.Middleware.init(header_name: "foo") == [header_name: "foo"]
  end
end
