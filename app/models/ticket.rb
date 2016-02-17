class Ticket < ActiveRecord::Base
 
  belongs_to :project
  belongs_to :author, class_name: "User"

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, length: { maximum: 1000 }
end
