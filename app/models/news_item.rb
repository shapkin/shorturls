class NewsItem < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true
  validates :url_key, presence: true, uniqueness: true

  before_validation :generate_url_key, on: :create

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