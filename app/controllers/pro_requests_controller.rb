class ProRequestsController < ApplicationController
  def create
    @pro_request = ProRequest.new(pro_request_params)

    respond_to do |format|
      if @pro_request.save
        format.html { redirect_to enterprise_path, notice: 'Votre demande a été prise en compte.' }
        format.js { @pro_request = ProRequest.new }
      else
        format.html { render 'pages/pro' }
        format.js
      end
    end
  end

  private

  def pro_request_params
    params.require(:pro_request).permit(:first_name, :last_name, :email, :phone, :company, :message)
  end
end
