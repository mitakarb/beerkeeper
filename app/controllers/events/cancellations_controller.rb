class Events::CancellationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.cancel(params.dig(:cancellation, :reason))

    redirect_to @event, notice: 'イベントをキャンセルしました'
  end
end
