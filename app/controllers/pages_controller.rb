class PagesController < ApplicationController
  def home
    @commute_request = CommuteRequest.new
  end

  def enterprise; end

  def legal; end
end
