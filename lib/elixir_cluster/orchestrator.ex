defmodule ElixirCluster.Orchestrator do
  # Would be cool to add a polling mechanism here that periodically pings the network
  # and determines what the consensus is for who the goose is, if it's different from
  # what's stored in this "remote" state then it updates this servers state and updates
  # rest of the network

  # need to account for the fact that node could die by the time consensus is reached
end
