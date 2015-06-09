class Post < ActiveRecord::Base
  attr_accessible :course_id, :title, :description, :tag

  belongs_to :course
  has_many :resumes

  validates :title, :presence => { :message => "Wprowadź nazwę postu." }
	validates :description, :presence => { :message => "Wprowadź opis postu." }
	validates :tag, :presence => { :message => "Wprowadź tagi postu." }

  def self.search(query)
    where("tag like ?", "%#{query}%")
  end

  default_scope { order('created_at DESC') }
end
