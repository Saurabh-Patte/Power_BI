[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared #"Dataflow 1" = let
  Source = PowerPlatform.Dataflows([]),
  #"Navigation 1" = Source{[Id = "Workspaces"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[workspaceId = "df4b4387-fb78-41c9-a4bb-66c2f796d228"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[dataflowId = "3000c750-3f88-4457-9491-c3111217f5c6"]}[Data]
in
  #"Navigation 3";
