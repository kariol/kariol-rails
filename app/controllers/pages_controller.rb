class PagesController < ApplicationController
  def home
    @commute_request = CommuteRequest.new(origin: Address.new, destination: Address.new)
  end

  def enterprise; end

  def legal; end
end
