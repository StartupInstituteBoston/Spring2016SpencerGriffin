class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true, length: { minimum: 10 }

  belongs_to :owner
end
