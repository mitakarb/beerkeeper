class ParticipationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    participation = Participation.new(user: current_user, event: event)
    if participation.save
      flash[:success] = "イベント参加登録しました"
    else
      flash[:warning] = "イベントに参加できませんでした"
    end
    redirect_back fallback_location: event_path(event)
  end
end
