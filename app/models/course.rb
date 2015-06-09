class Course < ActiveRecord::Base
  attr_accessible :name, :description, :tag, :user_id

  has_many :enrollments
  has_many :groups, :through => :enrollments
  has_many :posts
  belongs_to :user

  validates :name, :presence => { :message => "Wprowadź nazwę kursu." }
  validates :description, :presence => { :message => "Wprowadź opis kursu." }
  validates :tag, :presence => { :message => "Wprowadź tagi kursu." }

  default_scope { order('created_at DESC') }

  def self.search(query)
    where("tag like ?", "%#{query}%")
  end
end
