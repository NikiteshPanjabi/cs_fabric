[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Query = let
  Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WSktJS1GKjQUA", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Column1 = _t])
in
  Source;
