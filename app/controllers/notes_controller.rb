class NotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user_and_lead
  
  # GET /users/:user_id/leads/:lead_id/notes/new
  def new
    @note = @lead.notes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @note }
    end
  end

  # POST /users/:user_id/leads/:lead_id/notes
  def create
    @note = @lead.notes.build(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to [@user, @lead], :notice => 'Note was successfully created.' }
        format.json { render :json => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.json { render :json => @note.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  
  def get_user_and_lead
    @user = User.find params[:user_id]
    @lead = @user.leads.find params[:lead_id]
    authorise(@user)
  end
end
