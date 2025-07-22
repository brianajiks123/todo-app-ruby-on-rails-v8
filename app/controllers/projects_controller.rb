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
            flash[:notice] = "Project was successfully created."
            redirect_to @project
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
            flash[:notice] = "Project was successfully updated."
            redirect_to @project
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy!
        flash[:notice] = "Project was successfully destroyed."
        redirect_to projects_path
    end

    private
    def project_params
        params.require(:project).permit(:name)
    end
end
