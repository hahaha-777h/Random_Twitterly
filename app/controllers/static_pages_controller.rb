class StaticPagesController < ApplicationController
  def home
    @theme = Theme.find_by(id: session[:current_theme_id])
  unless @theme
    @theme = Theme.order("RANDOM()").first
    session[:current_theme_id] = @theme.id
  end
    @posts = @theme.posts.order(created_at: :desc)
    @post = Post.new
  end

  def shuffle
    @theme = Theme.where.not(id: session[:current_theme_id]).order("RANDOM()").first
    session[:current_theme_id] = @theme.id
    redirect_to root_path
  end
end
