# frozen_string_literal: true

class TablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_table, only: %i[show edit update destroy]
  after_action :verify_authorized

  def index
    @tables = Table.all
    authorize @tables
  end

  def show
    authorize @table
  end

  def new
    @table = Table.new
    authorize @table
  end

  def edit
    authorize @table
  end

  def create
    @table = Table.new(table_params.merge(user: current_user))
    authorize @table

    if @table.save
      redirect_to tables_url, notice: 'Table was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @table

    if @table.update(table_params)
      redirect_to tables_url, notice: 'Table was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @table
    @table.destroy

    redirect_to tables_url, notice: 'Table was successfully destroyed.'
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:name, :capacity, :available)
  end
end
