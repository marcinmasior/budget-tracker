class ContainersController < DashboardController
  before_action :set_container, only: %i[ show edit update destroy ]
  before_action :set_template_containers, except: %i[index]

  def index
    params[:q] ||= { template_eq: 'false' }

    @q = current_user.containers.ransack(params[:q])
    @containers = @q.result
  end

  def show
    @q = @container.records.ransack(params[:q])
    @records = @q.result
  end

  def new
    @container = Container.new
  end

  def edit
  end

  def create
    @container = Container.new(container_params)
    @container.user = current_user

    template_id = container_template.dig(:template_id)

    if template_id.present?
      template_container = Container.find(template_id)
      template_container.records.each do |record|
        @container.records.build(record.attributes.except("id", "created_at", "updated_at"))
      end
    end

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

    def set_template_containers
      @template_containers = current_user.containers.where(template: true)
    end

    def container_params
      params.require(:container).permit(:name, :template)
    end

    def container_template
      params.require(:container).permit(:template_id)
    end
end
