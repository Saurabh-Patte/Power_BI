[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Query = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/Saurabh-Patte/Fabric-Data-Engineer/refs/heads/main/AdventureWorks_Calendar.csv"), [Delimiter = ",", Columns = 1, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Date", type date}})
in
  #"Changed column type";
shared NavigationQuery = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false])
in
  Source;
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  #"Navigation 1" = Source{[workspaceId = "f6f37e29-3a0a-4113-b788-41558f43c488"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "46c440bc-cacf-4010-80c7-48bbe95e7bd0"]}[Data]
in
  #"Navigation 2";
