[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Query = let
  Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WMjQ0VIrViVYyAgKl2FgA", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Column1 = _t]),
  #"Changed column type" = Table.TransformColumnTypes(Source, {{"Column1", Int64.Type}})
in
  #"Changed column type";
