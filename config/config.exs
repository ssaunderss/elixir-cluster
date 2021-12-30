use Mix.Config

config :elixir_cluster, cowboy_port: 7777
config :elixir_cluser, n_nodes: 5
config :elixir_cluster, n_network_partiions: 0
config :elixir_cluster, node_port_block: 8000
config :elixir_cluster, node_cookie: :change_this_to_something_secret_and_unique
