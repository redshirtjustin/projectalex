class Story < ActiveRecord::Base
  belongs_to :section
  belongs_to :priority
  belongs_to :pipeline

  has_many :atomchain
  has_many :atoms, through: :atomchains

  # Scopes
  scope :business_econ, -> { where(section_id: 1)}
  scope :gov_politics, -> { where(section_id: 2)}
  scope :sports, -> { where(section_id: 3)}
  scope :science, -> { where(section_id: 4)}
  scope :environment, -> { where(section_id: 5)}
  scope :arts_entertainment, -> { where(section_id: 6)}

  alias_attribute :title, :subject
end
