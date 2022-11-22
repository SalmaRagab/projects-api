class EmployeeService
    def self.get_employee_by_id id
        begin
            response = RestClient.get "https://employees-api.vercel.app/api/employees/#{id}"
            employee = JSON.parse(response.body)
        rescue => exception
            return nil
        end
    end
end
