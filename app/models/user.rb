class User < ApplicationRecord
    has_many :organizations
    has_many :posts
    has_many :messages
    has_secure_password

    validates :first_name, presence: true 
    validates :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }, allow_nil: true, unless: proc { |x| x.password.blank? }


    def full_name
        "#{self[:first_name]} #{self[:last_name]}"
    end

    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!

        UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
      end
      # This generates a random password reset token for the user
      def generate_token(column)
        begin
          self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
      end
end
