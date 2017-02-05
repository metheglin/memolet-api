class V1::MemosController < PrivateResourceController
  def index
    items = Memo.user(current_user.id)
    render json: items
  end

  def create
    memo = MemoCreateCommand.new(current_user.id).exec!( memo_params )
    # memo = Memo.create!(memo_params)
    render json: {
      memo_id: memo.id
    }
  end

  private
    def memo_params
      params.permit(
        :content,
        tags: [],
      )#.merge( user_id: current_user.id )
    end
end
