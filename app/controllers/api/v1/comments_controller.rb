class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:update, :show, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      render json: @comment, status: :accepted
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.permit(:name, :content, :shoe_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
