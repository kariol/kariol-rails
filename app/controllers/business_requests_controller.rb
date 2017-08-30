class BusinessRequestsController < ApplicationController
  def create
    @business_request = BusinessRequest.new(business_request_params)

    respond_to do |format|
      if @business_request.save
        format.html { redirect_to enterprise_path, notice: 'Votre demande a été prise en compte.' }
        format.js { @business_request = BusinessRequest.new(address: Address.new) }
      else
        format.html { render 'pages/enterprise' }
        format.js
      end
    end
  end

  private

  def business_request_params
    params.require(:business_request).permit(
      :first_name, :last_name, :email, :phone, :company, :employee_range, :message,
      address_attributes: [:complete]
    )
  end
end
