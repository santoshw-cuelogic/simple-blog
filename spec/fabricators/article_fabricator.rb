Fabricator(:article) do
  subject{ sequence(:subject) { |i| "Subject#{i}" } }
  description{ sequence(:description) { |i| "Description#{i}" } }
  status{ sequence(:status) { |i| "Status#{i}" } }
  posted_at{ sequence(:posted_at) { |i| "Posted_at#{i}" } }
end
