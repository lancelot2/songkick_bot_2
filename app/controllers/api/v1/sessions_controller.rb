class Api::V1::SessionsController < Api::V1::BaseController

 #acts_as_token_authentication_handler_for User, except: [ :index, :show ]
 before_action :set_session, only: [ :show, :update ]
 skip_before_filter :verify_authenticity_token, :only => [:context_update]
 def update
   if @session.update(session_params)
     render :show
   else
     render_error
   end
 end

  def context_update
  session = find_session(params[:fbid])
  p "FETCHED SESSION"
  p session.id
  context = session.context
  p "CONTEXT"
  context["city"] = params[:city]
  context["artists"] = params[:artists]
  context["country"] = params[:country]

  session.update(context: context)
  p "UPDATED CONTEXT"
  p session.context
  sender = Messenger::Bot::Transmitter.new(params[:fbid])
  username = sender.get_profile[:body]["first_name"]
  answer(session, username, sender)
  respond_to do |format|
    format.js
  end
 end

 # def create
 #   @session = find_or_create_session(params[:fbid])
 #   p @session
 #   @room = find_or_create_room(params[:fbid], params[:first_name])
 #   @message = Message.new({content: params["msg"], room_id: @room.id, sender: params[:sender]})
 #   @message.save!
 # end

 private

 def session_params
   params.require(:session).permit(:name, :address)
 end

 def render_error
   render json: { errors: @session.errors.full_messages }, status: :unprocessable_entity
 end

 def find_session(fbid)
    Session.where(facebook_id: fbid).order(:created_at).last
  end

end
