class BloggersController < ApplicationController
    def new
        @blogger = Blogger.new
        #byebug
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
          flash[:success] = "Object successfully created"
          redirect_to @blogger
        else
          flash[:error] = "Something went wrong"
          #byebug
          render 'new'
        end
    end
    
    def show
        @blogger = Blogger.find_by(id: params[:id])
    end
    
    def index
        @bloggers=Blogger.all
    end
    private

    def blogger_params
        params.require(:blogger).permit([:name, :age, :bio])
    end
end
