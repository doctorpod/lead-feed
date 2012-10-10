class LeadsController < ApplicationController
  before_filter :authenticate_user!# , :get_user_and_authorise
  
  # GET /leads
  # GET /leads.json
  def index
    if params[:tag]
      @leads = current_user.leads.tagged_with(params[:tag]).order(:last_contacted)
    else
      @leads = current_user.leads.order(:last_contacted)
    end
    
    if @leads.empty?
      if flash[:notice] && flash[:notice].match(/welcome to/i)
        notice = "#{flash[:notice]}\nCreate your first lead"
      else
        notice = "Create your first lead"
      end
      redirect_to new_lead_path, :notice => notice
    end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @lead = current_user.leads.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lead }
    end
  end

  # GET /leads/new
  # GET /leads/new.json
  def new
    @lead = current_user.leads.build
    # 
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render :json => @lead }
    # end
  end

  # GET /leads/1/edit
  def edit
    @lead = current_user.leads.find(params[:id])
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = current_user.leads.build(params[:lead])

    respond_to do |format|
      if @lead.save
        format.html { redirect_to @lead, :notice => 'Lead was successfully created.' }
        format.json { render :json => @lead, :status => :created, :location => @lead }
      else
        format.html { render :action => "new" }
        format.json { render :json => @lead.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leads/1
  # PUT /leads/1.json
  def update
    @lead = current_user.leads.find(params[:id])

    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to @lead, :notice => 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lead.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead = current_user.leads.find(params[:id])
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end
  # 
  # private
  # 
  # def get_user_and_authorise
  #   current_user = current_user #User.find params[:user_id]
  #   authorise current_user
  # end
end
