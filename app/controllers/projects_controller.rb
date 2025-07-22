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
end
