class Atom < ActiveRecord::Base
	acts_as_taggable
	has_many :citations
	has_many :atomchains
end
