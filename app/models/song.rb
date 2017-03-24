class Song < ActiveRecord::Base
  validates :artist, presence: true, length: {minimum:2}
  validates :title, presence: true, length: {minimum:2}
end
