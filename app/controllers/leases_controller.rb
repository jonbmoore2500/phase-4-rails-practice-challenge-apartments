class LeasesController < ApplicationController


    def create
        lease = Lease.create(lease_params)
        if lease.valid?
            # if lease.apartment && lease.tenant 
            #     render json: lease, status: :created
            # else
            #     render json: {error: "Apartment and Tenant must exist"}, status: :unprocessable_entity
            # end
            render json: lease, status: :created
        else
            render json: {errors: lease.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        lease = find_lease
        if lease
            lease.destroy
            render json: lease
        else
            render json: {error: "Lease not found"}, status: :not_found
        end
    end

    private

    def find_lease
        Lease.find_by(id: params[:id])
    end

    def lease_params
        params.permit(:rent, :tenant_id, :apartment_id)
    end

end