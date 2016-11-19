class Photo < ApplicationRecord

	belongs_to :blog

	validates_presence_of :image

	mount_uploader :image, PhotoUploader

end