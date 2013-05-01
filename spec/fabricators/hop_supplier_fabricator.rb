Fabricator(:hop_supplier) do
  name { sequence(:name) { |i| "Hop Supplier #{i}" } }
end
