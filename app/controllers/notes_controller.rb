class NotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_lead
  
  # GET /leads/:lead_id/notes/new  -- Called via AJAX
  def new
    @note = @lead.notes.build
  end

  # POST /leads/:lead_id/notes  -- Called via AJAX
  def create
    @note = @lead.notes.build(params[:note])

    unless @note.save
      render :action => "new"
    end
  end
  
  private
  
  def get_lead
    @lead = current_user.leads.find params[:lead_id]
  end
end
