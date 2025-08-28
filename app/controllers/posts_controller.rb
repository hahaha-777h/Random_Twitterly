class PostsController < ApplicationController
  def index
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿が保存されました。"
    else
      @theme = Theme.find(@post.theme_id)  # render の時に必要
      @posts = @theme.posts.order(created_at: :desc) # 投稿一覧も必要
      render "static_pages/home", status: :unprocessable_entity
    end
  end


  private

  def post_params
    params.require(:post).permit(:content, :theme_id)
  end
end
