class Comment < ActiveRecord::Base

  before_create :set_previous_state
	after_create :set_ticket_state

  belongs_to :ticket  
  belongs_to :author, class_name: "User"
  belongs_to :state
  belongs_to :previous_state, class_name: "State"

  delegate :project, to: :ticket

  validates :text, presence: true

  scope :persisted, lambda { where.not(id: nil) }

  private
  
	def set_ticket_state
		ticket.state = state
		ticket.save!
	end

  def set_previous_state
    self.previous_state = ticket.state
  end
end
