class NewsItem < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true
end