class RegistrationsController < Devise::RegistrationsController
	prepend_before_filter :require_no_authentication, :except => [ :update, :create, :destroy ]

	def create
		if user_signed_in?
			user = current_user.children.build(user_params)
			if user.save
				user.add_role :host
				redirect_to	hosts_index_path
			else
				redirect_to	hosts_new_path
			end
		else
			super
		end
	end

	def update
		if user_signed_in?
			user = User.find(params[:id])
			redirect_to	(user.update_attributes(user_params) ? hosts_index_path : edit_host_path)
		else
			super
		end
	end


	def destroy
		if user_signed_in?
			User.find(params[:id]).destroy
			redirect_to	hosts_index_path
		else
			super
		end
	end

	private

	def user_params
		if params[:user][:password].present?
			params.require(:user).permit(:name, :email, :language, :password, :password_confirmation)
		else
			params.require(:user).permit(:name, :email, :language)
		end
	end
end
