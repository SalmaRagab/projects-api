class ProjectsController < ApplicationController
    def index
        projects = Project.all
        render json: projects
    end

    def create
        project = Project.new(project_params)
        if project.save
            render json: project
        else
            render json: {
                reasons: project.errors.full_messages
            }, status: :unprocessable_entity
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :owner_id, :state)
    end
end
