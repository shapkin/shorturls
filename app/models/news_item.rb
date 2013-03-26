class NewsItem < ActiveRecord::Base

  before_create :generate_url_key

  attr_accessible :title, :url_key

  private

    def generate_url_key
      key = Digest::MD5.hexdigest("#{id}#{Time.now.utc}").slice(0..7)
      if NewsItem.find_by_url_key(key)
        generate_url_key
      else
        self.url_key = key
      end
    end
end