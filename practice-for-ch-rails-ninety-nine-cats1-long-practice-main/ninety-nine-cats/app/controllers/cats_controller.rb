class CatsController < ApplicationController
    def index

        # if params[:cat][:id]
        #     cat = cat.find_by(id: params[:cat][:id])
        #     if cat.nil?
        #         render json: ['no cat found'], status: 404
        #     else
        #         render json: cat
        #     end
        # else  
            @cats = Cat.all
            render :index
        # end
      
    end

    def show # find by id
        @cat = Cat.find_by(id: params[:id])
		render :show
    end

    def update
        @cat = Cat.find_by(id: params[:id])

		if @cat.nil?
			render json: ['no cat found'], status: 404
        elsif @cat.update(cat_params)
            redirect_to cat_url(@cat.id)
        else
            render json: cat.errors_full_messages, status: :unprocessable_entity
		end
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save!
            render json: @cat
        else
            render json: @cat.errors.full_messages, status: :unprocessable_entity
        end
    end


    private
    def cat_params
		params.require(:cat).permit(:birth_date, :color, :name, :sex)
	end
end
