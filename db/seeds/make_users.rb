admin_u = User.find_or_create_by(email: 'admin@me.com') do |u|
  u.password='admin123'
  u.confirmed_at = Time.now.utc
  u.admin=true
end

u2 = User.find_or_create_by(email: 'just_u@me.com') do |u|
  u.password='userme123'
  u.confirmed_at = Time.now.utc
  u.admin=false
end
