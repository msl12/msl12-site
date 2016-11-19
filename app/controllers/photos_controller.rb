class PhotosController < ApplicationController

	def create
		@photo = Photo.new
		@photo.image = params[:file]
		if @photo.image.blank?
			render status: 400
			return
    	end

    	if @photo.save
    		render json: {url: @photo.image.url}
    	end
	end

end