class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
	 conditions = warden_conditions.dup
	 if login = conditions.delete(:login)
	   where(conditions).where(["lower(phoneno) = :value OR lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	 else
	   if conditions[:phoneno].nil?
	     where(conditions).first
	   else
	     where(phoneno: conditions[:phoneno]).first
	   end
	 end
   end

   validate :validate_username, :validate_phoneno

   def validate_username
     if User.where(email: username).exists?
       errors.add(:username, :invalid)
     end
   end

   def validate_phoneno
     if User.where(username: phoneno).exists?
       errors.add(:phoneno, :invalid)
     end
   end

end
