class User < ActiveRecord::Base
has_secure_password

# *********** RELATIONSHIPS ************************
    has_many :profile_pictures
    has_many :artists
    
# *********** VALIDATIONS **************************
    validates :first_name, presence: true, length:(2..50)

    validates :last_name, presence: true, length:(2..50)

    validates :email, presence: true, 
                      uniqueness: true,
                      format: {
                        with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                      }
    validates :zip_code, presence: true, length: {is: 5}
    validates :terms_conditions, presence: true                 

# *********** Calls Functions ************************
    geocoded_by :zip_code
    after_validation :geocode, :if => :zip_code_changed?
    before_save :downcase_email
    before_save :capitalize_name

# *********  FUNCTIONS ******************************
 
    def full_name 
        self.first_name + " " + self.last_name
    end

    def downcase_email
        self.email = email.downcase
    end

    def capitalize_name
        self.first_name = first_name.capitalize
        self.last_name = last_name.capitalize
    end

    def generate_password_reset_token!
        update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
    end

end