class PagesController < ApplicationController
  def home
    @commute_request = CommuteRequest.new
    @commute_request.build_origin
    @commute_request.build_destination
  end

  def enterprise; end

  def legal; end
end
