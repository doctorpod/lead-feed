class LeadsController < ApplicationController
  before_filter :authenticate_user!, :get_user_and_authorise
  
  # GET /leads
  # GET /leads.json
  def index
    @leads = @user.leads.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leads }
    end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @lead = Lead.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/new
  # GET /leads/new.json
  def new
    @lead = @user.leads.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/1/edit
  def edit
    @lead = @user.leads.find(params[:id])
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = @user.leads.build(params[:lead])

    respond_to do |format|
      if @lead.save
        format.html { redirect_to [@user, @lead], notice: 'Lead was successfully created.' }
        format.json { render json: @lead, status: :created, location: @lead }
      else
        format.html { render action: "new" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leads/1
  # PUT /leads/1.json
  def update
    @lead = @user.leads.find(params[:id])

    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to [@user, @lead], notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead = @user.leads.find(params[:id])
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to user_leads_url(@user) }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_user_and_authorise
    @user = User.find params[:user_id]
    authorise @user
  end
end
