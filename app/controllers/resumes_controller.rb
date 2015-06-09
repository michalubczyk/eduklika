class ResumesController < ApplicationController

  before_action :authenticate_user!

  def index
    @course = Course.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @resumes = @post.resumes.order("created_at DESC")
  end

  def new
    @course = Course.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @resume = @post.resumes.new
  end

  def create
    @course = Course.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @resume = @post.resumes.new(resume_params)

    if @resume.save
      redirect_to course_posts_path, :notice => "Plik został dodany."
    else
      render "new"
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @resume = @post.resumes.find(params[:id])
    @resume.destroy!
    redirect_to course_posts_path, :notice => "Plik został usunięty."
  end

private
  def resume_params
    params.require(:resume).permit(:post_id, :name, :attachment)
  end
end
