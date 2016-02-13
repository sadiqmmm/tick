class Ticket < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true
  validates :description, length: { maximum: 1000 }
end
