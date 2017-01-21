class SitePage < ActiveRecord::Base
  belongs_to :site
  has_many :components, dependent: :destroy
end
