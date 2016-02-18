class Ticket < ActiveRecord::Base
 
  before_create :assign_default_state
  
  attr_accessor :tag_names 

  belongs_to :project
  belongs_to :author, class_name: "User"
  belongs_to :state

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  has_many :comments, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags, uniq: true

  validates :name, presence: true
  validates :description, length: { maximum: 1000 }

  def tag_names
    @tag_names
  end
  
  def tag_names=(names)
    @tag_names = names
  end

  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
    self.tags << Tag.find_or_initialize_by(name: name)
    end
  end

  private
		def assign_default_state
  		self.state ||= State.default
		end
end
