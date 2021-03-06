class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, :uniqueness => true, :length => {
      :minimum => 10,
      :message => 'must be at least ten characters long.'
  }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)$}i,
    message: 'URL must be in format GIF, JPG or PNG.'
  }
end
