# elixir-cluster
duck duck goose


## Starting it up

## Variables
In `config/config.exs` there are a few variables you can set for this system:
- `cowboy_port`: port for the orchestrator http server
- `n_nodes`: number of nodes in the system (if you're just running on one machine, I designed it so that this should have an upper bound of 1000 to stick within one `port block`)
- `n_network_partiions`: number of network partitions (needs to be less than `n_nodes`)
- `node_port_block`: base TCP port number for a block (i.e. 8000 - this could then be incremeneted by `n_nodes` variable. For example if `n_nodes` is 1000 and the port block is 8000, then nodes would be created within the range 8000-8999)
- You can switch the port of the http server over in `config/config.exs`


## Logic
1. On startup need to arbitrarily pick a "goose" node
2. If something happens to the "goose" node a new "goose" node needs to be picked from one of the ducks
3. If a deceased "goose" node attempts to come back online after a new "goose" node is assigned, it needs to be repurposed as a "duck"
4. If a node truly dies, it's http server should shut down as well (defined in supervision tree)
5. Need a polling mechanism for figuring out which nodes are down and reviving them


## Limitations
1. Using a non-distributed external state (GenServer)

## Further Work
1. Come up with a better consensus for netsplit