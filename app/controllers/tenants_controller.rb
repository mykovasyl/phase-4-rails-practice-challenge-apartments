class TenantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

def index
  tenants = Tenant.all 
  render json: tenants
end

def show
  tenant = find_tenant
  render json: tenant
end

def create
  new_tenant = Tenant.create!(tenant_params)
  render json: new_tenant, status: :created
end

def update
  update_tenant = find_tenant
  update_tenant.update(tenant_params)
  render json: update_tenant, status: :accepted
end

def destroy
  delete_tenant = find_tenant
  delete_tenant.destroy
  head :no_content
end

private

def find_tenant
  Tenant.find(params[:id])
end

def tenant_params
  params.permit(:number)
end

def render_not_found
  render json: { error: "Tenant not found" }, status: :not_found
end

def render_unprocessable_entity(exception)
  render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
end

end
