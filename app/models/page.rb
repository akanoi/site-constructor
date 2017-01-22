class Page < ActiveRecord::Base
  belongs_to :site
  has_many :widgets, dependent: :destroy
end
