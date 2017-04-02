# Maxwell Request Id Middleware

[![Build Status](https://travis-ci.org/doughsay/maxwell_request_id.svg?branch=master)](https://travis-ci.org/doughsay/maxwell_request_id)
[![Code Coverage](https://img.shields.io/codecov/c/github/doughsay/maxwell_request_id.svg)](https://codecov.io/gh/doughsay/maxwell_request_id)
[![Hex.pm](https://img.shields.io/hexpm/v/maxwell_request_id.svg)](http://hex.pm/packages/maxwell_request_id)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/doughsay/maxwell_request_id.svg)](https://beta.hexfaktor.org/github/doughsay/maxwell_request_id)

Maxwell middleware for adding x-request-id to outgoing requests.

It takes the `:request_id` property from the Logger metadata and passes it on under the `x-request-id` header in outgoing http requests made through maxwell.

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

  middleware MaxwellRequestId.Middleware

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
middleware MaxwellRequestId.Middleware, [header_name: "x-transaction-id"]
```


## TODO

* [ ] Docs
* [ ] Check opts like other maxwell middleware
