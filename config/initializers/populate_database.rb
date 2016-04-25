def populate_database
  if User.table_exists? and User.count == 0
    if Rails.env == "test"
      FactoryGirl.create(:admin_user)
    else
      User.create(email: ENV["admin_email"], password: ENV["admin_password"], admin: true)
    end
  end
end



def populate_signatures
  Signature.destroy_all

  17.times { FactoryGirl.create(:signature, created_at: 0.days.ago) }
  13.times { FactoryGirl.create(:signature, created_at: 1.days.ago) }
  5.times { FactoryGirl.create(:signature, created_at: 2.days.ago) }
  3.times { FactoryGirl.create(:signature, created_at: 3.days.ago) }
  7.times { FactoryGirl.create(:signature, created_at: 4.days.ago) }
  9.times { FactoryGirl.create(:signature, created_at: 5.days.ago) }

end
