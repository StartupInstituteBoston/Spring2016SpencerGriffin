class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :description, :owner_id, :phone
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "invalid"}

  belongs_to :owner
end
