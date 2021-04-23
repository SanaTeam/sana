class User < ApplicationRecord
  attr_accessor :reset_token
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

    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_digest,  User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
    end
    def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
    end
  
    private
  
      # Converts email to all lower-case.
      def downcase_email
        self.email = email.downcase
      end
  
      # Creates and assigns the activation token and digest.
      def create_activation_digest
        self.activation_token  = User.new_token
        self.activation_digest = User.digest(activation_token)
      end
end
