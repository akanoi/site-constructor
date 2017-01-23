class Site < ActiveRecord::Base
  belongs_to :user
  has_many :pages, dependent: :destroy

  searchable do
    text :title, :boost => 2
    text :description
  end
end
