class User < ActiveRecord::Base
    attr_accessible :name, :email, :password, :password_confirmation
    attr_accessor :password, :remember_token, :activation_token, :reset_token
    

    validates_presence_of :name
    validates_length_of :name, :maximum => 30

    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates_presence_of :email
    validates_format_of :email, :with => email_regex
    validates_uniqueness_of :email, :case_sensitive => false

    validates_presence_of :password
    validates_confirmation_of :password
    validates_length_of :password, :within => 6..30

    before_save :encrypt_password

    def has_password?(submitted_password)
        self.salt = make_salt if new_record?
        encrypted_password == encrypt(submitted_password)
    end

    def self.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil if user.nil?
        return user if user.has_password?(submitted_password)
    end

    def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        (user && user.salt == cookie_salt) ? user : nil

    end

    

    private
        
        def encrypt_password
            self.encrypted_password = encrypt(password)
        end

        def encrypt(string)
            secure_hash("#{salt}--#{string}")
        end

        def make_salt
            secure_hash("#{Time.now.utc}--#{password}")
        end

        def secure_hash(string)
            Digest::SHA2.hexdigest(string)
        end
end
