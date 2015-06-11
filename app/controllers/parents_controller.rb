class ParentsController < ApplicationController
  before_action :logged_in?
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  # GET /parents
  # GET /parents.json
  def index
    @parent = Parent.find(session[:user_id])
    @student = Student.find(@parent.student_id)
    redirect_to students_path(@student)
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(parent_params)

    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:name, :email, :password_digest, :student_id)
    end

    def logged_in?
      # if session[:user_type] != "parent"
      #   redirect_to sessions_login_path, notice: "You can't access that page."
      # end
    end
end
