# MaxwellRequestId

Maxwell middleware for adding x-request-id to outgoing requests.

It takes the ``:request_id` property from the Logger metadata and passes it on under the `x-request-id` header in outgoing http requests made through maxwell.

## Installation

Add `maxwell_request_id` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:maxwell_request_id, "~> 0.1.0"}]
end
```


## Usage

```elixir
defmodule MyClient do
  use Maxwell.Builder, ~w(get)a

  middleware Maxwell.Middleware.RequestId

  def my_request_with_request_id(path) do
    path
    |> new()
    |> get()
  end
end
```


## Configuration

When adding the middleware, you can specify the name of the header to use for outgoing requests:

```elixir
middleware Maxwell.Middleware.RequestId, [header_name: "x-transaction-id"]
```
