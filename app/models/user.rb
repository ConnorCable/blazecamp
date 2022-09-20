class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_save :set_admin
  
  has_many :projects, dependent: :destroy


  def username
    return self.email.split('@')[0].capitalize
  end
  def set_admin
    self.admin = User.count == 1
  end

end
