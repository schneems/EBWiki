class TestPagesController < ApplicationController
  def show
  	render template: "test_pages/#{params[:page]}"
  end
end
