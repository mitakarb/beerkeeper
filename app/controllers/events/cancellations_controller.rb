class Events::CancellationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.cancel(params.dig(:cancellation, :reason))

    redirect_to root_path, notice: 'イベントをキャンセルしました'
  end
end
