class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
          flash[:success] = "Post successfully created"
          redirect_to @post
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
          flash[:success] = "Post was successfully updated"
          redirect_to @post
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    def like
        @post=Post.find_by(id:params[:id])
        @post.likes+=1
        @post.save
        redirect_to @post
    end
    
    private
    def post_params
        params.require(:post).permit([:title, :content, :blogger_id, :destination_id])
    end
end
