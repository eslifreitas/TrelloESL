class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_options_person_for_select, only: [:index, :show, :new, :edit, :update, :create]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @project = Project.new
    @project.build_manager    
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.build_manager
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    
    respond_to do |format|
      if @project.save
        flash[:notice] = "Projeto salvo com sucesso"    
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        #flash[:success] = "Projeto atualizado com sucesso"          
        flash[:notice] = "Projeto atualizado com sucesso"         
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :manager_id,
        histories_attributes: [:name, :requester_id, :status, :owner_id, :description, :started_at, :finished_at, :deadline, :points, :_destroy]
      )
    end

    def set_options_person_for_select
        @person_options_for_select = Person.all
    end
end
