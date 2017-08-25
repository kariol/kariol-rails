class CommuteRequestsController < ApplicationController
  def create
    @commute_request = CommuteRequest.new(commute_request_params)

    respond_to do |format|
      if @commute_request.save
        format.html { redirect_to root_path, notice: 'Commute Request was successfully created.' }
      else
        format.html { render 'pages/home' }
      end
    end
  end

  private

  def commute_request_params
    params.require(:commute_request).permit(:origin, :destination, :arrival_time, :email)
  end
end
