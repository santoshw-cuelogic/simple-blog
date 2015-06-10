Fabricator(:comment) do
  guest_name{ sequence(:guest_name) { |i| "Guest Name#{i}" } }
  guest_email{ sequence(:guest_email) { |i| "Guest Email#{i}" } }
  comment{ sequence(:comment) { |i| "Comment#{i}" } }
  comment_date{ sequence(:comment_date) { |i| "Comment Date#{i}" } }
end
