[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Query = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/Saurabh-Patte/Fabric-Data-Engineer/refs/heads/main/AdventureWorks_Calendar.csv"), [Delimiter = ",", Columns = 1, QuoteStyle = QuoteStyle.None])
in
  Source;
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  #"Navigation 1" = Source{[workspaceId = "f91ce2e4-459e-4d23-ae5b-9a78b2254ab0"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "5a5b2797-98bd-4caf-af6d-47e45199aceb"]}[Data]
in
  #"Navigation 2";
