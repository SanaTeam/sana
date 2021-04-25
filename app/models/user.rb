class User < ApplicationRecord
  attr_accessor :reset_token
    has_many :organizations
    has_many :posts
    has_many :messages
    has_secure_password

    validates :first_name, presence: true 
    validates :last_name, presence: true
    validate :email_or_oauth_present?
    validates :password, length: { minimum: 6 }, allow_nil: true, unless: proc { |x| x.password.blank? }


    def email_or_oauth_present?
        if !self[:email] && !self[:oauth_id]
          errors.add(:email, "No email/oauth present")
        end
        if self[:email] && !self[:oauth_id]
          if self[:email].blank?
            errors.add(:email, "can't be blank")
          elsif !self[:email].match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
            errors.add(:email, "invalid format")
          end
        end
    end

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

    searchkick

    def search_data
        {
            full_name: full_name,
            email: email
        }
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
