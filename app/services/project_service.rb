class ProjectService

    def self.get_all
        ProjectRepository.get_all
    end

    def self.create_new_project(project_params)
        ProjectRepository.create(project_params)
    end

    def self.update_existing_project(project_id, project_params)
        ProjectRepository.update(project_id, project_params)
    end

    def self.assign_participants_to_project(project_id, project_participants_params)
        ProjectRepository.assign_participants(project_id, project_participants_params)
    end
end
