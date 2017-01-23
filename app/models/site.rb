class Site < ActiveRecord::Base
  belongs_to :user
  has_many :pages, dependent: :destroy
  validates :title, :description, :user_id, :menu, presence: true

  searchable do
    text :title, :boost => 2
    text :description
  end
end
