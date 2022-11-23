module ProjectsHelper
    def calculate_projects_insights
        total_projects = @projects.count

        planned_projects_percentage = calculate_percentage(:planned, total_projects)
        active_projects_percentage = calculate_percentage(:active, total_projects)
        done_projects_percentage = calculate_percentage(:done, total_projects)
        failed_projects_percentage = calculate_percentage(:failed, total_projects)

        return {
            planned_projects: planned_projects_percentage,
            active_projects: active_projects_percentage,
            done_projects: done_projects_percentage,
            failed_projects: failed_projects_percentage
        }
    end

    private
    
    def calculate_percentage project_state, total_projects
        "#{(@projects.select{ |project| project.state == project_state.to_s }.count * 100.0 / total_projects).round(2)}%"
    end
end