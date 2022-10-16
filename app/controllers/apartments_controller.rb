class ApartmentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

def index
  apartments = Apartment.all 
  render json: apartments
end

def show
  apartment = find_apartment
  render json: apartment
end

def create
  new_apartment = Apartment.create!(apartment_params)
  render json: new_apartment, status: :created
end

def update
  update_apartment = find_apartment
  update_apartment.update(apartment_params)
  render json: update_apartment, status: :accepted
end

def destroy
  delete_apartment = find_apartment
  delete_apartment.destroy
  head :no_content
end

private

def find_apartment
  Apartment.find(params[:id])
end

def apartment_params
  params.permit(:number)
end

def render_not_found
  render json: { error: "Apartment not found" }, status: :not_found
end

def render_unprocessable_entity(exception)
  render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
end


end
