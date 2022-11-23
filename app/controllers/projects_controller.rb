class ProjectsController < ApplicationController
    include ProjectsHelper

    def index
        @projects = ProjectService.get_all
        render json: {
            insights: calculate_projects_insights, 
            projects: ActiveModelSerializers::SerializableResource.new(@projects, each_serializer: ProjectSerializer)
        }
    end

    def create
        project = ProjectService.create_new_project(project_params)
        unless project.id == nil
            render json: project
        else
            render json: {
                reasons: project.errors
            }, status: :unprocessable_entity
        end
    end

    def update
        project = ProjectService.update_existing_project(params[:id], project_params)
        if project
            handle_response(project)
        else
            render json: {
                reasons: "Project not found"
            }, status: :not_found
        end
    end

    def assign_participants
        project = ProjectService.assign_participants_to_project(params[:id], project_participants_params)
        if project
            handle_response(project)
        else
            render json: {
                reasons: "Project not found"
            }, status: :not_found
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :owner_id, :state)
    end

    def project_participants_params
        params.permit(project_participants_attributes: [:id, :_destroy, :participant_id])
    end

    def handle_response project
        if project.errors.count > 0
            render json: {
                reasons: project.errors
            }, status: :unprocessable_entity
        else
            render json: project
        end
    end
end
