class ProjectParticipant < ApplicationRecord
    belongs_to :project

    validates :project_id, :participant_id, presence: true
    validate :participant_is_employee?

    validates :participant_id, uniqueness: { scope: :project_id }

    def participant_is_employee?
        employee = EmployeeService.get_employee_by_id(participant_id)
        if (employee['role'] != 'employee')
            errors.add(:project, 'Participant must be an employee')
        end
        return employee['role'] == 'employee'
    end
end
