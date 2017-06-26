class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :email, presence: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)

    puts "#{email}"
    puts "#{password}"

    user = User.find_by_email(email)

    puts "this is user #{user}"

    if user && user.authenticate(password)
      puts "got to authenticate"
      return user
    end
      puts "got nil"
      nil
  end

end
