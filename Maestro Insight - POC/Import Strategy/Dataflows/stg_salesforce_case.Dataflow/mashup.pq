[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Case = let
  Source = GoogleBigQuery.Database([BillingProject = null, UseStorageApi = null, ConnectionTimeout = null, CommandTimeout = null, ProjectId = null]),
  #"Navigation 1" = Source{[Name = "cs-maestro-insights-poc-cc07"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "prod_staging", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "stg_salesforce__case", Kind = "View"]}[Data],
  #"Choose columns" = Table.SelectColumns(#"Navigation 3", {"case_id", "case_number", "contact_id", "account_id", "actual_date_opened", "actual_date_closed", "case_status", "case_subject", "case_priority", "case_link", "rapid_response_environment"}),
  #"Renamed columns" = Table.RenameColumns(#"Choose columns", {{"case_id", "Case ID"}, {"case_number", "Case Number"}, {"account_id", "Account ID"}, {"actual_date_opened", "Open Date"}, {"actual_date_closed", "Close Date"}, {"case_status", "Status"}, {"case_subject", "Subject"}, {"case_priority", "Priority"}, {"case_link", "Case Link"}, {"rapid_response_environment", "Rapid Response Environment ID"}})
in
  #"Renamed columns";
