class ProjectsController < ApplicationController
    include ProjectsHelper

    before_action :set_project, only: [:update, :assign_participants]

    def index
        @projects = Project.all
        render json: { insights: calculate_projects_insights , projects: @projects }
    end

    def create
        project = Project.new(project_params)
        if project.save
            render json: project
        else
            render json: {
                reasons: project.errors
            }, status: :unprocessable_entity
        end
    end

    def update
        if @project.update(project_params)
            render json: @project
        else
            render json: {
                reasons: @project.errors
            }, status: :unprocessable_entity
        end
    end

    def assign_participants
        if @project.update(project_participants_params)
            render json: @project
        else
            render json: {
                reasons: @project.errors
            }, status: :unprocessable_entity
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :owner_id, :state)
    end

    def project_participants_params
        params.permit(project_participants_attributes: [:id, :_destroy, :participant_id])
    end

    def set_project
        @project = Project.find(params[:id])
        render :status => 404 if @project.nil?
    end
end
