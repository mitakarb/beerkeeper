class ParticipationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    if event.receive(current_user)
      flash[:success] = "イベント参加登録しました"
    else
      flash[:alert] = "イベントに参加できませんでした"
    end
    redirect_back fallback_location: event_path(event)
  end
end
