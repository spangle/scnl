class MessagePostsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => :destroy
  
  def index
    @message_posts = MessagePost.paginate(:page => params[:page])
    @title = "All posts"
  end
  
  def show
    @message_post = MessagePost.find(params[:id])
		@user = @message_post.user
    @title = @message_post.subject
  end

  def new
    @message_post  = MessagePost.new
    @title = "Create message"
  end
  
  def create
    @message_post = current_user.message_posts.build(params[:message_post])
    if @message_post.save
      redirect_to @message_post, :flash => { :success => "Message created." }
    else
      @title = "Create Message"
      render 'new'
    end
  end

  def destroy
		@message_post = MessagePost.find(params[:id])
    @message_post.destroy
    redirect_to message_posts_path, :flash => { :success => "Message destroyed." }
  end

  private
    
    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end
