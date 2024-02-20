class General < ApplicationRecord
  has_one_attached :photo
  has_one_attached :photo_about
end
