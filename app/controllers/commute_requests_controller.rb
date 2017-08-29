class CommuteRequestsController < ApplicationController
  def create
    @commute_request = CommuteRequest.new(commute_request_params)

    respond_to do |format|
      if @commute_request.save
        format.html { redirect_to root_path, notice: 'Votre demande a été prise en compte.' }
        format.js do
          @commute_request = CommuteRequest.new
          @commute_request.build_origin
          @commute_request.build_destination
        end
      else
        format.html { render 'pages/home' }
        format.js
      end
    end
  end

  private

  def commute_request_params
    params.require(:commute_request).permit(
      :arrival_time, :email,
      origin_attributes: [:complete],
      destination_attributes: [:complete]
    )
  end
end
