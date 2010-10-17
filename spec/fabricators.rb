Fabricator(:entry) do
  severity 'info'
  facility 'test'
  payload   { {:test => "info"} }
  timestamp { Time.now }
end
