class Resume < ActiveRecord::Base
  attr_accessible :post_id, :name, :attachment
	belongs_to :post

	mount_uploader :attachment, AttachmentUploader

  validates :name, :presence => { :message => "Wprowadź nazwę pliku." }
  validates :attachment, :presence => { :message => "Dodaj plik." }

end
