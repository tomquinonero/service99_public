class UsersController < ApplicationController

  def bulk_new

  end

  def add_users
    if !users_params[:csv_raw].blank?
      response = Faraday.post 'http://localhost:5000/csv_processing', { :data => users_params[:csv_raw] } 
      handle_api_call(response)
    elsif !users_params[:csv_file].blank?
      up_file = users_params[:csv_file]
      response = Faraday.post 'http://localhost:5000/csv_processing', { :data => up_file.read } 
      handle_api_call(response)
    else
      redirect_to add_users_path, alert: "You have to specify a text or a file"
    end

    render 'table_display'
  end

  private

  def handle_api_call response
    body = JSON.parse response.body

    if body['error']
      redirect_to add_users_path, alert: body['error']
    else
      @data = body
    end
  end

  def users_params
    params.permit(:csv_raw, :csv_file)
  end

end
