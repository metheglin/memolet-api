# class V1::MemoPadsController < PrivateResourceController
#   def index
#     render json: MemoPad.user(current_user.id)
#   end

#   def create
#     pad = MemoPad.create!(memo_pad_params)
#     render json: {
#       memo_pad_id: pad.id
#     }
#   end

#   private
#     def memo_pad_params
#       params.permit(:title).merge( user_id: current_user.id )
#     end
# end
