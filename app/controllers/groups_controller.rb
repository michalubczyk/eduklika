class GroupsController < ApplicationController
  before_action :authenticate_user!

	def index
		@course = Course.find(params[:course_id])
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
	end

	def new
		@groups = Group.all
	end

	def create
		@course = Course.find(params[:course_id])
		@group = Group.find(params[:group_id])

		@check = Enrollment.where(:course_id => @course.id).where(:group_id => @group.id)

		if @check.exists?
			redirect_to :back, :alert => "Grupa jest już przypisana do tego kursu."
		else
			@enrollment = Enrollment.new(:course_id => @course.id, :group_id => @group.id)
			if @enrollment.save
				redirect_to :back, :notice => "Grupa została dodana do kursu."
			else
				render "new"
			end
		end
	end

	def destroy
		@course = Course.find(params[:course_id])
		group_id = params[:id]
        @enrollment = Enrollment.where(:course_id => @course.id).where(:group_id => group_id)
        Enrollment.destroy(@enrollment)
        redirect_to :back, :notice => "Grupa została usunięta z kursu."
    end
end
