class RecordsController < ApplicationController
  before_action :set_container, only: %i[ new create edit update destroy ]
  before_action :set_record, only: %i[ edit update destroy ]

  def index
    @records = @container.records
  end

  def new
    @record = Record.new
  end

  def edit
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    @record.container = @container

    if @record.save
      redirect_to @container, notice: "Record was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @record.update(record_params)
      redirect_to @container, notice: "Record was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy

    redirect_to @container, notice: "Record was successfully destroyed."
  end

  private
    def set_container
      @container = current_user.containers.find(params[:container_id])
    end

    def set_record
      @record = @container.records.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:date, :record_type, :description, :category_id, :value, :paid)
    end
end
