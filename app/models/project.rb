class Project < ApplicationRecord
    include Assignable
    acts_as_employee_data :owner_id, :manager

    has_many :project_participants

    accepts_nested_attributes_for :project_participants, allow_destroy: true

    validates :name, :state, :owner_id, presence: true
    validates_length_of :name , maximum: 255

    enum state: { planned: 0, active: 1, done: 2, failed: 3 }
end
