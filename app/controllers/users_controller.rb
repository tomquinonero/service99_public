class UsersController < ApplicationController

  def bulk_new

  end

  def add_users
    if !users_params[:csv_raw].blank?
      puts 'raw'
    elsif !users_params[:csv_file].blank?
      puts 'file'
    else
      redirect_to add_users_path, alert: "You have to specify a text or a file"
    end

  end

  private

  def users_params
    params.permit(:csv_raw, :csv_file)
  end

end
