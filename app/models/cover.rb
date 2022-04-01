class Cover < ActiveRecord::Base
	belongs_to :item
	has_attached_file :cover

	validates_attachment :cover, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

	before_post_process :process_only_covers

	def process_only_covers
     %w(image/jpeg, image/png,image/gif,image/pjpeg, image/x-png).include?(cover_content_type)
    end


end
