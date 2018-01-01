class CalendarEventsController < ApplicationController
  before_action :set_calendar_event, only: [:show, :edit, :update, :destroy]

  # GET /calendar_events
  def index
    @calendar_events = CalendarEvent.all
    authorize @calendar_events
  end

  # GET /calendar_events/1
  def show
    @commentable = @calendar_event
    @comments = @commentable.comments
    @comment = Comment.new
    @event_owner = @calendar_event.user
  end

  # GET /calendar_events/new
  def new
    @calendar_event = CalendarEvent.new
    authorize @calendar_event

    respond_to do |format|
      format.html { render :partial => 'new' }
      format.js
    end
  end

  # GET /calendar_events/1/edit
  def edit
    respond_to do |format|
      format.html { render :partial => 'edit' }
      format.js
    end
  end

  # POST /calendar_events
  def create
    @calendar_event = CalendarEvent.new(calendar_event_params)
    @calendar_event.user = current_user
    authorize @calendar_event

    respond_to do |format|
      if @calendar_event.save
        format.html {redirect_to action: "index"}
        format.json {render :json => @calendar_event,
                    :status => :created, :location => @calendar_event }
      else
        format.html {render :partial => 'new'}
        format.json {render :json => @post.errors,
                    :status => :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /calendar_events/1
  def update
    respond_to do |format|
      if @calendar_event.update(calendar_event_params)
        format.html {redirect_to action: "index"}
        format.json {render :json => @calendar_event,
                    :status => :created, :location => @calendar_event }
      else
        format.html {render :partial => 'edit'}
        format.json {render :json => @post.errors,
                    :status => :unprocessable_entity}
      end
    end
  end

  # DELETE /calendar_events/1
  def destroy
    @calendar_event.destroy
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_event
      @calendar_event = CalendarEvent.friendly.find(params[:id])
      authorize @calendar_event
    end

    # Only allow a trusted parameter "white list" through.
    def calendar_event_params
      params.require(:calendar_event).permit(:title, :description, :start_time, :end_time, :event_type, :address, :city, :state_id, :zipcode, :latitude, :longitude, :user_id)
    end
end
