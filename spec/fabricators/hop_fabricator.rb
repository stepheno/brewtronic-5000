Fabricator(:hop) do 
  name { sequence(:name) { |i| "Hop #{i}" } } 
  alpha { 4.0 }
  beta  { 1.0 }
  hsi   { 0.25 } 
  hop_supplier { Fabricate(:hop_supplier) } 
end
