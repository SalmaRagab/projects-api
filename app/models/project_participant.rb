class ProjectParticipant < ApplicationRecord
    include Assignable
    acts_as_employee_data :participant_id, :employee

    belongs_to :project

    validates :project_id, :participant_id, presence: true

    validates :participant_id, uniqueness: { scope: :project_id }

end
