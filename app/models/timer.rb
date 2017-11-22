

class Timer < ApplicationRecord
	 mount_uploaders :photos, PhotosUploader
	 serialize :photos, JSON
	 belongs_to :user
	 validates :time ,presence: true
	 validates :photos, presence: true

	 filterrific(
    available_filters: [
    	:with_country_name
    ]
  )

  scope :with_country_name, lambda { |country_name|
  	joins(:user).where('users.country LIKE ?', "%#{country_name}%")
    # Filters students with any of the given country_ids
    
  }

	 # geocoded_by :address
  #  after_validation :geocode

end
