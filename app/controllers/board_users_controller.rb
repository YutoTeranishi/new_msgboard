class BoardUsersController < ApplicationController
  before_action :set_board_user, only: %i[ show edit update destroy ]
  before_action :authenticate_account!
  # GET /board_users or /board_users.json
  def index
    #@board_users = BoardUser.all
    users =  BoardUser.where 'account_id == ?',current_account.id
    if users[0] ==nil then
      user = BoardUser.new
      user.account_id = current_account.id
      user.nickname = '<<no name>>'
      user.save
      users =  BoardUser.where 'account_id == ?',current_account.id
    end
    @board_users = users[0]
  end

  # GET /board_users/1 or /board_users/1.json
  def show
    @board_user = BoardUser.find(params[:id])
  end

  # GET /board_users/new
  def new
    #@board_user = BoardUser.new
    redirect_to '/board_message'
  end

  # GET /board_users/1/edit
  def edit
    redirect_to '/board_message'
  end

  # POST /board_users or /board_users.json
  def create
    redirect_to '/board_message'
=begin
    @board_user = BoardUser.new(board_user_params)

    respond_to do |format|
      if @board_user.save
        format.html { redirect_to board_user_url(@board_user), notice: "Board user was successfully created." }
        format.json { render :show, status: :created, location: @board_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_user.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /board_users/1 or /board_users/1.json
  def update
    respond_to do |format|
      if @board_user.update(board_user_params)
        #format.html { redirect_to board_user_url(@board_user), notice: "Board user was successfully updated." }
        format.html { redirect_to '/board_message'}
        format.json { render :show, status: :ok, location: @board_user }
      else
        #format.html { render :edit, status: :unprocessable_entity }
        format.html { render :index}
        format.json { render json: @board_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_users/1 or /board_users/1.json
  def destroy
    redirect_to '/board_message'
=begin
    @board_user.destroy

    respond_to do |format|
      format.html { redirect_to board_users_url, notice: "Board user was successfully destroyed." }
      format.json { head :no_content }
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_user
      @board_user = BoardUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_user_params
      params.require(:board_user).permit(:nickname, :account_id, :memo)
    end
end
