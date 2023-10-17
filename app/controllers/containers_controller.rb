class ContainersController < DashboardController
  before_action :set_container, only: %i[ show edit update destroy ]

  def index
    @containers = current_user.containers
  end

  def show
  end

  def new
    @container = Container.new
  end

  def edit
  end

  def create
    @container = Container.new(container_params)
    @container.user = current_user

    if @container.save
      redirect_to container_url(@container), notice: "Container was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @container.update(container_params)
      redirect_to container_url(@container), notice: "Container was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @container.destroy

    redirect_to containers_url, notice: "Container was successfully destroyed."
  end

  private

    def set_container
      @container = current_user.containers.find(params[:id])
    end

    def container_params
      params.require(:container).permit(:name)
    end
end
