[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[BindToDefaultDestination = true]
shared AdventureWorks_Calendar = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/Saurabh-Patte/Fabric-Data-Engineer/refs/heads/main/AdventureWorks_Calendar.csv"), [Delimiter = ",", Columns = 1, QuoteStyle = QuoteStyle.None])
in
  Source;
[BindToDefaultDestination = true]
shared AdventureWorks_Product_Categories = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/Saurabh-Patte/Fabric-Data-Engineer/refs/heads/main/AdventureWorks_Product_Categories.csv"), [Delimiter = ",", Columns = 2, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductCategoryKey", Int64.Type}, {"CategoryName", type text}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared AdventureWorks_Product_Subcategories = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/Saurabh-Patte/Fabric-Data-Engineer/refs/heads/main/AdventureWorks_Product_Subcategories.csv"), [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductSubcategoryKey", Int64.Type}, {"SubcategoryName", type text}, {"ProductCategoryKey", Int64.Type}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared AdventureWorks_Products = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/Saurabh-Patte/Fabric-Data-Engineer/refs/heads/main/AdventureWorks_Products.csv"), [Delimiter = ",", Columns = 11, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductKey", Int64.Type}, {"ProductSubcategoryKey", Int64.Type}, {"ProductSKU", type text}, {"ProductName", type text}, {"ModelName", type text}, {"ProductDescription", type text}, {"ProductColor", type text}, {"ProductSize", type text}, {"ProductStyle", type text}, {"ProductCost", type number}, {"ProductPrice", type number}})
in
  #"Changed column type";
shared NavigationQuery = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false])
in
  Source;
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  #"Navigation 1" = Source{[workspaceId = "f6f37e29-3a0a-4113-b788-41558f43c488"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "781cf00d-f6b7-426a-9cae-ffe919439baf"]}[Data]
in
  #"Navigation 2";
