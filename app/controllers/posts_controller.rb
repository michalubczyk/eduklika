class PostsController < ApplicationController
  before_action :authenticate_user!

	def index
		@course = Course.find(params[:course_id])
		if params[:search]
			@posts = @course.posts.search(params[:search])
		else
			@posts = @course.posts.all
		end
	end

	def show
		@course = Course.find(params[:course_id])
		@post = @course.posts.find(params[:id])
	end

	def new
		@course = Course.find(params[:course_id])
		@post = @course.posts.new
	end

	def create
		@course = Course.find(params[:course_id])
		@post = @course.posts.new(params[:post])
		if @post.save
			redirect_to course_posts_path, :notice => "Post został utworzony."
		else
			render "new"
		end
	end

	def edit
		@course = Course.find(params[:course_id])
		@post = @course.posts.find(params[:id])
	end

	def update
		@course = Course.find(params[:course_id])
		@post = @course.posts.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to course_posts_path, :notice => "Post został zaktualizowany."
		else
			render "edit"
		end
	end

	def destroy
		@course = Course.find(params[:course_id])
		@post = @course.posts.find(params[:id])
		@post.destroy!
		redirect_to course_posts_path(@course), :notice => "Post został usunięty."
	end
end
