class Blog < ActiveRecord::Base
	# attr_accessible :name, :url, :rss, :img, :content_path, :hidden, :shirt_name, :guid, :category_id, :description, :last_parse_time

	has_many :posts, :dependent => :destroy
	mount_uploader :image, ImageUploader

	after_initialize  :gen_guid
	before_save :set_letter

  private

  def set_letter
    self.letter = Pinyin.t(self.name).chr if self.letter.blank?
    self.short_name = Pinyin.t(self.name).gsub(/[[:blank:]]/, '') if self.short_name.blank?
  end

  def gen_guid
    begin
      guid = rand(36**12).to_s(36)
      while !Blog.where(:guid => guid).empty?
        guid = rand(36**12).to_s(36)
      end
      self.guid = guid if self.guid.blank?
    rescue ActiveModel::MissingAttributeError
    end
  end
end
