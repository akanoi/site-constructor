class Page < ActiveRecord::Base
  belongs_to :site
  has_many :widgets, dependent: :destroy

  validates :title, :layout, :site_id, presence: true

  searchable do
    text :title
  end
end
