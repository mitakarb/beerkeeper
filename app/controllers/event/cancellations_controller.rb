class Event::CancellationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.cancel(params[:cancellation][:reason])

    redirect_to @event, notice: 'イベントをキャンセルしました'
  end
end
