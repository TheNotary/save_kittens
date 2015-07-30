def populate_database
  if User.table_exists? and User.count == 0
    User.create(email: "admin@eff.org", password: ENV["CATS_ADMIN_PASSWORD"], admin: true)
  end
end
