class EventsController < ApplicationController
  before_action :set_event, only: %i(show edit update destroy)
  before_action :authorize_organizer, only: %i(edit update destroy)

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.organizer_id = current_user.id

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      flash[:alert] = "Event creation failed."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      flash[:alert] = "Event update failed."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    if @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    else
      redirect_to @event, alert: 'Event could not be destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def authorize_organizer
      return redirect_to root_url, notice: 'オーガナイザーではないため編集できません。' unless @event.organizer?(current_user)
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      permitted = params.fetch(:event, {}).permit(
        :start_at,
        :end_at,
        :start_at_date,
        :start_at_time,
        :end_at_date,
        :end_at_time,
        :location,
        :name,
        :max_size,
        :budget,
        :description
      )

      if permitted[:start_at_date].present? && permitted[:start_at_time].present?
        permitted[:start_at] = parse_datetime(permitted[:start_at_date], permitted[:start_at_time])
      end

      if permitted[:end_at_date].present? && permitted[:end_at_time].present?
        permitted[:end_at] = parse_datetime(permitted[:end_at_date], permitted[:end_at_time])
      end
      permitted.except(:start_at_date, :start_at_time, :end_at_date, :end_at_time)
    end

    def parse_datetime(date, time)
      return nil if date.blank? || time.blank?

      Time.zone.strptime("#{date} #{time}", "%Y-%m-%d %H:%M")
    rescue ArgumentError
      nil
    end
end
