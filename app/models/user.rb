class User < ActiveRecord::Base

  has_secure_password

  # better alternative to user = User.where("email ILIKE ?", email_parsed).first

  # before_save :sanitize_email 

  # def sanitize_email
  #   email.strip.downcase 
  # end


  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }

  

  def self.authenticate_with_credentials(email, password)

    email_parsed = email.strip

    user = User.where("email ILIKE ?", email_parsed).first

    if user && user.authenticate(password)
      return user
    end
    return nil
  end

end
