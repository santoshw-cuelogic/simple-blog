Fabricator(:comment) do
  subject{ sequence(:guest_name) { |i| "Guest Name#{i}" } }
  description{ sequence(:guest_email) { |i| "Guest Email#{i}" } }
  status{ sequence(:comment) { |i| "Comment#{i}" } }
  posted_at{ sequence(:comment_date) { |i| "Comment Date#{i}" } }
end
