class PartnersController < ApplicationController
  before_action :set_partner, only: %i[show update destroy]

  def index
    @partners = Partner.all
  end

  def show; end

  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      render :show, status: :created, location: @partner
    else
      render json: @partner.errors, status: :unprocessable_entity
    end
  end

  def update
    if @partner.update(partner_params)
      render :show, status: :ok, location: @partner
    else
      render json: @partner.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @partner.destroy
  end

  private

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit(:trading_name, :owner_name, :coverage_area,
                                    addresses_attributes: %i[type_address coordinates])
  end
end
