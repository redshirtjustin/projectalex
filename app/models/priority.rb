class Priority < ActiveRecord::Base
	has_many :stories

	alias_attribute :title, :pri_name
end
