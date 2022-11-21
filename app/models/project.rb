class Project < ApplicationRecord
    validates :name, :state, :owner_id, presence: true
    validates_length_of :name , maximum: 255
    enum status: { planned: 0, active: 1, done: 2, failed: 3 }
end
