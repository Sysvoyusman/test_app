class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy, :editstatus]
  #This line is causing error 
  #before_filter :authenticate_user!

  #after_action :verify_authorized, except: :index
  #after_action :verify_authorized, except:  [:index ,:new], unless: :devise_controller?
  #after_action :verify_authorized, except:  [:index], unless: :devise_controller?
  #You have to call authorization on all methods excpt these ^^^
  #after_action :verify_authorized, except:  , unless: :devise_controller?
  #if there is no edit then we have Skip_pundit_error  vvvvv
  after_action :verify_policy_scoped, except: [:index,:show, :new, :create ,:edit ,:destroy ,:update ,:editstatus], unless: :skip_pundit?
  #after_action :verify_policy_scoped, only: :index

  # GET /bugs
  # GET /bugs.json

  def editstatus
    #@bug = Bug.where(id: params[:id], user_id: params[:user_id])
    if params[:change_status] == "Resolved"
      @bug.update(status: "Resolved")
    #else
    elsif params[:change_status] == "Done"
      @bug.update(status: "Done")
    else 
      @bug.update(status: "Active")
    #  @groupUser.update(membership: "denied")
    end
    #redirect_to groupshow_path(:id => params[:id])
    redirect_to bugs_path(@bug)
  end


  def index
    @bugs = Bug.all
    #@bug = Bug.find(params[:id])
    authorize @bugs
    #here we will render different views with respect to users
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
    #authorize @bug
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
    #if authorized not called here , it will give an error
    #if it runs and return false , only then it will be able to give the error message i.e application-con
    authorize @bug
  end

  # GET /bugs/1/edit
  def edit
    #authorize @bug
  end

  # POST /bugs
  # POST /bugs.json
  def create
    
    @bug = Bug.new(bug_params)
    authorize @bug
    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
    
    
  end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: 'Bug was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
    #authorize @bug
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    authorize @bug
    #why the bug is being destroyed even after authorize @bug
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, notice: 'Bug was successfully destroyed.' }
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
      authorize @bug
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:title, :description, :status, :user_id , :image)
    end

    
end
