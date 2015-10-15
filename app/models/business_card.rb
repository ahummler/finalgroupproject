class BusinessCard < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar, styles: { medium: "270x270>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
    validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 5.megabytes
end
