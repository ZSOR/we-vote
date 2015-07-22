class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]



    def index
        @posts = Post.all
        
    end
    
    def new
        @post = current_user.posts.build
    
    end
    
    
    def create
        @post = current_user.posts.build(post_params)
    
    
        if @post.save
            redirect_to @post, notice: "Successfully create new post"
        
        else
            render 'new'
        end
    end
    
    
    def show
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Post was successfully updated"
        else
            render 'edit'
        end
    end
    
  
    
    def destroy
        @post.destroy
        redirect_to root_path
    end
    
    
    
    
    
    private
    
    def post_params
    
        params.require(:post).permit(:title)
    end
    

    def find_post
        @post = Post.find(params[:id])
    end

end