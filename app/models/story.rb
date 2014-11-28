class Story < ActiveRecord::Base
  belongs_to :section
  belongs_to :priority
  belongs_to :pipeline

  has_many :atomchains
end
