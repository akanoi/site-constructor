class SitePage < ActiveRecord::Base
  belongs_to :site
  has_many :widgets, dependent: :destroy
end
