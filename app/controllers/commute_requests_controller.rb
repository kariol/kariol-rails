class CommuteRequestsController < ApplicationController
  def create
    @commute_request = CommuteRequest.new(commute_request_params)

    respond_to do |format|
      if @commute_request.save
        format.html { redirect_to root_path, notice: 'Commute Request was successfully created.' }
      else
        format.html { render :new }
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
