class CalendarEventsController < ApplicationController
  before_action :set_calendar_event, only: [:show, :edit, :update, :destroy]

  # GET /calendar_events
  def index
    @calendar_events = CalendarEvent.all
  end

  # GET /calendar_events/1
  def show
  end

  # GET /calendar_events/new
  def new
    @calendar_event = CalendarEvent.new

    respond_to do |format|
      format.html { render :partial => 'new' }
      format.js
    end
  end

  # GET /calendar_events/1/edit
  def edit
  end

  # POST /calendar_events
  def create
    @calendar_event = CalendarEvent.new(calendar_event_params)

    if @calendar_event.save
      redirect_to action: "index", notice: 'Calendar event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /calendar_events/1
  def update
    if @calendar_event.update(calendar_event_params)
      redirect_to action: "index", notice: 'Calendar event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /calendar_events/1
  def destroy
    @calendar_event.destroy
    redirect_to action: "index", notice: 'Calendar event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_event
      @calendar_event = CalendarEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def calendar_event_params
      params.require(:calendar_event).permit(:title, :description, :start_time, :end_time, :event_type)
    end
end
