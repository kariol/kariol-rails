class PagesController < ApplicationController
  def home
    @commute_request = CommuteRequest.new(origin: Address.new, destination: Address.new)
  end

  def enterprise
    @business_request = BusinessRequest.new(address: Address.new)
  end

  def pro; end

  def legal; end
end
