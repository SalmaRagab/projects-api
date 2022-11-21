class Project < ApplicationRecord
    validates :name, :state, :owner_id, presence: true
    validates_length_of :name , maximum: 255
    validate :owner_is_manager?
    enum state: { planned: 0, active: 1, done: 2, failed: 3 }

    def owner_is_manager?
        employee = EmployeeService.get_employee_by_id(owner_id)
        if (employee['role'] != 'manager')
            errors.add(:project, 'Owner must be a manager')
        end
        return employee['role'] == 'manager'
    end
end
