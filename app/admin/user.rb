ActiveAdmin.register User do
  permit_params :name, :surname, :email, :function, :group_id, :password, :password_confirmation

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "User Details" do
      f.input :name
      f.input :surname
      f.input :email
      f.input :function, :as => :select, :collection => ["student", "teacher"], :selected => "student", :include_blank => false, :input_html => { :onchange => "
              if($(this).val() == 'teacher') $('#user_group_id').attr('disabled',true).val(0);
              else if($(this).val() == 'student') $('#user_group_id').attr('disabled',false);"}
      f.input :group_id, :as => :select, :collection => Group.all
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  controller do
    def update
      user = params["user"]
      if user && (user["password"] == nil || user["password"].empty?)
        user.delete("password")
        user.delete("password_confirmation")
      end

      update!
    end
  end

  member_action :confirm_user, method: :post do
    user = User.find(params[:id])
    user.confirm! if !user.confirmed?

    flash[:notice] = "User has been confirmed successfully"
    redirect_to admin_user_path(id: user.id)
  end
end
