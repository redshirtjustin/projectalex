class Pipeline < ActiveRecord::Base
	has_many :stories

	alias_attribute :title, :pip_name
end
