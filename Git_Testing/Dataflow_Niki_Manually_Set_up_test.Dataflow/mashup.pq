[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared #"Course Glossary" = let
  Source = Excel.Workbook(Web.Contents("https://kinaxis-my.sharepoint.com/personal/npanjabi_kinaxis_com/Documents/Course%20-%20360L.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Course Glossary", Kind = "Sheet"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"Column1", type text}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text}, {"Column5", type text}, {"Column6", type text}}),
  #"Promoted headers" = Table.PromoteHeaders(#"Changed column type", [PromoteAllScalars = true])
in
  #"Promoted headers";
