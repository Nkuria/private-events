class InvitationsController < ApplicationController
  include InvitationsHelper
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.create(user_id: params[:user_id], event_id: params[:event_id])
    if @invitation.save
      redirect_to event_path(@invitation.event_id), notice: 'Invitation sent'
    else
      redirect_to event_path(@invitation.event_id), alert: 'Error creating invitation!'
    end
  end
end
