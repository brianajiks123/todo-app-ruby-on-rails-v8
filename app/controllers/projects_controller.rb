class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        # projects/id
        # params = { "id" =>  id }
        # params[:id]
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        # {
        #     "project" => {
        #         "name": "Project 1"
        #     }
        # }
        # params[:project]
        if @project.save
            redirect_to @project
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def project_params
        params.require(:project).permit(:name)
    end
end
