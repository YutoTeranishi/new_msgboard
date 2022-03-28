class BoardMessagesController < ApplicationController
  before_action :set_board_message, only: %i[ show edit update destroy ]

  # GET /board_messages or /board_messages.json
  def index
    @board_messages = BoardMessage.all
  end

  # GET /board_messages/1 or /board_messages/1.json
  def show
  end

  # GET /board_messages/new
  def new
    @board_message = BoardMessage.new
  end

  # GET /board_messages/1/edit
  def edit
  end

  # POST /board_messages or /board_messages.json
  def create
    @board_message = BoardMessage.new(board_message_params)

    respond_to do |format|
      if @board_message.save
        format.html { redirect_to board_message_url(@board_message), notice: "Board message was successfully created." }
        format.json { render :show, status: :created, location: @board_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_messages/1 or /board_messages/1.json
  def update
    respond_to do |format|
      if @board_message.update(board_message_params)
        format.html { redirect_to board_message_url(@board_message), notice: "Board message was successfully updated." }
        format.json { render :show, status: :ok, location: @board_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_messages/1 or /board_messages/1.json
  def destroy
    @board_message.destroy

    respond_to do |format|
      format.html { redirect_to board_messages_url, notice: "Board message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_message
      @board_message = BoardMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_message_params
      params.require(:board_message).permit(:content, :board_user_id)
    end
end
