class Ticket < ActiveRecord::Base
 
  before_create :assign_default_state

  belongs_to :project
  belongs_to :author, class_name: "User"
  belongs_to :state

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, length: { maximum: 1000 }

  private
		def assign_default_state
  		self.state ||= State.default
		end
end
