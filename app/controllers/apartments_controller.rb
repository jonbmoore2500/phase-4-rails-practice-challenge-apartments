class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show
        apartment = find_apartment
        if apartment
            render json: apartment
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    def create
        apartment = Apartment.create(apartment_params)
        if apartment.valid?
            render json: apartment, status: :created
        else
            render json: {errors: apartment.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def update
        apartment = find_apartment
        if apartment
            apartment.update(apartment_params)
            if apartment.valid?
                render json: apartment
            else
                render json: {errors: apartment.errors.full_messages}, status: :unprocessable_entity
            end 
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    def destroy
        apartment = find_apartment
        if apartment
            apartment.destroy
            render json: apartment
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    private

    def find_apartment
        Apartment.find_by(id: params[:id])
    end

    def apartment_params
        params.permit(:number)
    end

end