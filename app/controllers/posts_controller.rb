class PostsController < ApplicationController
    def index   
        @post = Post.all()
    
    end 
    def edit
        @post = Post.find(params[:id])

    end
    def update
        @post = Post.find(params[:id])
        if(@post.update(posts_params))
            redirect_to  @post # this will redirect it to show view!!!
         else
            render 'edit'  
         end 
    end
    def new 
        @post=Post.new
    end 

    def show
      @post = Post.find(params[:id])
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path

    end

    def create
    # here we can just render post param where post is the ID of that form  
    # render plain: params[:post].inspect

    # here @ is used to define a variable and it is cool and easy
    # in Post.new(); Post represent the modal and i new we can pass in the params
    # @post = Post.new(params[:post]);
     @post = Post.new(posts_params);

     if(@post.save)
        redirect_to  @post # this will redirect it to show view!!!
     else
        render 'new'  
     end 
    end
     

    private def posts_params
     params.require(:post).permit(:title, :body)
    end 
end
