class TestPageController < ApplicationController
	def show
		render template: "test_page/#{params[:page]}"
	end
end
