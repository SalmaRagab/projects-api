class ProjectRepository
    def self.get_all
        @projects = Project.includes(:project_participants)
    end

    def self.get_project_by_id(project_id)
        Project.includes(:project_participants).find_by(id: project_id)
    end

    def self.create(project_params)
        Project.create(project_params)
    end

    def self.update(project_id, project_params)
        project = get_project_by_id(project_id)
        return nil unless project
        
        project.update(project_params)
        project
    end

    def self.assign_participants(project_id, project_participants_params)
        project = get_project_by_id(project_id)
        return nil unless project
        
        project.update(project_participants_params)
        project
    end
end