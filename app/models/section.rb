class Section < ActiveRecord::Base
	has_many :stories

	alias_attribute :title, :sec_name
end
