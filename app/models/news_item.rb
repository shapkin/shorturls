class NewsItem < ActiveRecord::Base
  before_validation :generate_url_key, on: :create

  attr_accessible :title

  validates_presence_of :title, :url_key
  validates_uniqueness_of :url_key

  private

    def generate_url_key
      key = Digest::MD5.hexdigest("#{title}#{Time.now.to_f}").slice(0..7)
      if NewsItem.find_by_url_key(key)
        generate_url_key
      else
        self.url_key = key
      end
    end
end