[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[BindToDefaultDestination = true]
shared EMEA_DRT_FW10 = let
  Source = Sql.Database("saurabh", "My_Analytics"),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "EMEA_DRT_FW10"]}[Data]
in
  #"Navigation 1";
[BindToDefaultDestination = true]
shared Universal_TD_Data = let
  Source = Sql.Database("saurabh", "My_Analytics"),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "Universal_TD_Data"]}[Data]
in
  #"Navigation 1";
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  #"Navigation 1" = Source{[workspaceId = "f6f37e29-3a0a-4113-b788-41558f43c488"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "841c8d82-2183-4b16-813a-e97630c914bf"]}[Data]
in
  #"Navigation 2";
