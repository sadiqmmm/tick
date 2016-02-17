class Ticket < ActiveRecord::Base
 
  mount_uploader :attachment, AttachmentUploader
  
  belongs_to :project
  belongs_to :author, class_name: "User"

  validates :name, presence: true
  validates :description, length: { maximum: 1000 }
end
