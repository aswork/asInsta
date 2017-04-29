class PictsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pict, only: [:edit, :update, :destroy]
  def index
    @picts = Pict.all.reverse_order
  end

  def new
    @pict = Pict.new
  end

  def create
    @pict = Pict.new(picts_params)
    @pict.user_id = current_user.id
    if @pict.save
      redirect_to picts_path, notice: "投稿しました！"
  else
    render 'new'
    end
  end

  def edit
  end

  def update
    if @pict.update(picts_params)
      redirect_to picts_path, notice: "投稿を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @pict.destroy
    redirect_to picts_path, notice: "投稿を削除しました！"
  end



#private
  private
   def picts_params
     params.require(:pict).permit(:picture, :content, :image)
   end

   def set_pict
      @pict = Pict.find(params[:id])
    end

end
