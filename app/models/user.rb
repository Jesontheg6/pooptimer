class User < ApplicationRecord

has_secure_password 

has_many :timers, dependent: :destroy

    def self.options_for_sorted_by
    	 [
   
      ['Country (a-z)', 'country_asc']
    ]
 		 end





 validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}


#   validates :name , :presence 		=> true,
#  	  				:length							=> { :maximum => 50}

# # validates :email, :presence 	=> true,
# # 					:format 						=> { :with => email_regex},
# # 				  :uniqueness 				=> { :case_sensitive => false}

#    validates :password,:presence => true,
# 					:length 						=> { :within => 6..40}

# validates :gender , :presence  	=> true

# validates :country , :presence  	=> true

# validates :birthday ,:presence  	=> true

GENDER_TYPES = ["Male", "Female", "Others"] 


	def age
		date = Date.strptime(self.birthday,'%Y-%m-%d')
		(Date.today - date).to_i / 365
	end

    has_many :authentications, dependent: :destroy

    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        name: auth_hash["extra"]["raw_info"]["name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        gender: auth_hash["extra"]["raw_info"]["gender"],
        birthday: auth_hash["extra"]["raw_info"]["birthday"],
        country: auth_hash["extra"]["raw_info"]["homwtown"],
      #   @player = Player.new
    		# @player = Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y')
   			# 	@player.save


        # user.profile.city = auth.info.location.split(",")[0]
        
        password: SecureRandom.hex(5)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
 end


