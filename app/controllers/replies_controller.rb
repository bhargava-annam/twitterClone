class RepliesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @reply = @post.replies.create(params[:reply].permit(:name, :body))
        redirect_to post_path(@post)
        @users=User.all
      end
    
      def destroy
        @post = Post.find(params[:post_id])
        @reply = @post.replies.find(params[:id])
        @reply.destroy
        redirect_to post_path(@post)
        @users=User.all
      end
end
