module Assignable
    extend ActiveSupport::Concern

    included do
        class_attribute :employee_key, :employee_type

        validate :employee_has_required_role
    end
    
    def employee_has_required_role
        employee = EmployeeService.get_employee_by_id(self[employee_key])
        unless employee
            errors.add(:project, 'Employee id is not found')
            return false
        end

        if (employee['role'] != employee_type.to_s)
            errors.add(:project, "Supplied id must be a valid #{employee_type} id")
        end
        return employee['role'] == employee_type
    end

    module ClassMethods
        def acts_as_employee_data(employee_key, employee_type)
          self.employee_key = employee_key
          self.employee_type = employee_type
        end
      end
end