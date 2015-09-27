class UpdatesController < ApplicationController
  before_action :set_update, only: [:edit, :update, :destroy]
  before_action :set_deal, only: [:new, :create, :edit, :update, :destroy]

  def new
    @update = Update.new
    authorize @deal, :owner?
  end

  def edit
    authorize @deal, :owner?
  end

  def create
    @update = Update.new(update_params)
    @update.deal_id = @deal.id
    respond_to do |format|
      authorize @deal, :owner?
      if @update.save
        format.html { redirect_to @deal, notice: 'Update was successfully created.' }
        format.json { render :show, status: :created, location: @update }
      else
        format.html { render :new }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      authorize @deal, :owner?
      if @update.update(update_params)
        format.html { redirect_to @deal, notice: 'Update was successfully updated.' }
        format.json { render :show, status: :ok, location: @update }
      else
        format.html { render :edit }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @deal, :owner?
    @update.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_update
    @update = Update.find(params[:id])
  end

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

  def update_params
    params.require(:update).permit(:content)
  end
end
