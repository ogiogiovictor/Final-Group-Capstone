class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

ROLES = %w[admin user].freeze
        
def jwt_payload
  super
end

ROLES.each do |role_name|
  define_method "#{role_name}?" do
    self.role == role_name
  end
end

# def admin?
#   role == 'admin'
# end

# def user?
#   role == 'user'
# end

     # relationships
  has_many :motorcycles, dependent: :destroy
  has_many :bookings, dependent: :destroy

  #validates :name, presence: true
  #validates :role, inclusion: { in: ROLES }

end
