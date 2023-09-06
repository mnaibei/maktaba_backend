class Book < ApplicationRecord
  has_many :libraries
  has_many :users, through: :libraries

  mount_uploader :epub_file, EpubFileUploader
end
