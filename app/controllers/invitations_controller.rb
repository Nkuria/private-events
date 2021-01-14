class InvitationsController < ApplicationController
  include InvitationsHelper
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.create(invitation_params)
    if @invitation.save
      redirect_to event_path(@invitation.event_id)
    else
      redirect_to new_invitation_path, notice: 'Error'
    end
  end
end
