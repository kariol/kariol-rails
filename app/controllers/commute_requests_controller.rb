class CommuteRequestsController < ApplicationController
  def create
    @commute_request = CommuteRequest.new(commute_request_params)

    respond_to do |format|
      if @commute_request.save
        format.html { redirect_to root_path, notice: 'Votre demande a été prise en compte.' }
        format.js { @commute_request = CommuteRequest.new(origin: Address.new, destination: Address.new) }
      else
        format.html { render 'pages/home' }
        format.js
      end
    end
  end

  private

  def commute_request_params
    params.require(:commute_request).permit(
      :company, :arrival_time_string, :email,
      origin_attributes: [:complete],
      destination_attributes: [:complete]
    )
  end
end
