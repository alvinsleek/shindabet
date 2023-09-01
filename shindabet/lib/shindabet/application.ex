defmodule Shindabet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShindabetWeb.Telemetry,
      # Start the Ecto repository
      Shindabet.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Shindabet.PubSub},
      # Start Finch
      {Finch, name: Shindabet.Finch},
      # Start the Endpoint (http/https)
      ShindabetWeb.Endpoint
      # Start a worker by calling: Shindabet.Worker.start_link(arg)
      # {Shindabet.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Shindabet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShindabetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
