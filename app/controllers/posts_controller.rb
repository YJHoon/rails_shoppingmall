class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all
    # Item
    # Review
    # Wish
    # Order
    # LineItem
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def create
    post = current_user.create_post(post_params)
    redirect_to post_path(post), notice: '게시글이 성공적으로 생성되었습니다.'
  end

  def update
    @post.update_attributes!(post_params)
    redirect_to post_path(@post), notice: '게시글이 성공적으로 수정되었습니다.'
  end

  def destroy
    @post.destroy!
    redirect_to root_path, notice: '게시글이 성공적으로 삭제되었습니다.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
