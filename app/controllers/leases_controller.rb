class LeasesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

def create
  new_lease = Lease.create!(lease_params)
  render json: new_lease, status: :created
end

def destroy
  delete_lease = find_lease
  delete_lease.destroy
  head :no_content
end

private

def find_lease
  Lease.find(params[:id])
end

def render_not_found
  render json: { error: "Lease not found" }, status: :not_found
end

end
