class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # This is here for collission avoidance when generating new user names in tests
  def self.next_id
   self.last.nil? ? 1 : self.last.id + 1
  end

end
