class Post < ActiveRecord::Base
	# attr_accessible :title, :url, :blog_id, :last_pase_time, :hidden, :guid, :img

	belongs_to :blog
	after_initialize :gen_guid

	validates :blog_id, :presence => true
	mount_uploader :image, ImageUploader

	def gen_guid
    begin
      if self.guid.blank?
        guid = rand(36**12).to_s(36)
        while !Post.where(:guid => guid).empty?
          guid = rand(36**12).to_s(36)
        end  
        self.guid=guid
      end
    rescue ActiveModel::MissingAttributeError
    end
  end
end
