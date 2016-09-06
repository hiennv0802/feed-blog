class Post < ApplicationRecord
  before_create :full_url

  validates :url, uniqueness: true

  def full_url
    url.prepend(host) unless url.include? "http"
  end
end
