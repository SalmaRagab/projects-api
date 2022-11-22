class EmployeeService
    def self.get_employee_by_id id
        response = RestClient.get "https://employees-api.vercel.app/api/employees/#{id}"
        employee = JSON.parse(response.body)
    end
end
