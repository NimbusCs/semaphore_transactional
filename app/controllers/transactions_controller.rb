class TransactionsController < ApplicationController
  include TransactionsHelper
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = current_user.transactions

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    msg = { errors: {} }
    done = false
    begin
      validate = validate_transaction(current_user, params[:transaction])
      if validate[:done]
        done = true
      else
        msg[:errors] = validate[:errors]
      end
    end
    if done
      @transaction = current_user.transactions.build(transaction_params)
      if @transaction.save
        render json: @transaction, status: :created, location: @transaction
      end
    else
      render json: msg, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = current_user.transactions.find_by(tx_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:sender_code, :receiver_code, :status, :amount, :concept, :meta_data)
    end
    
end
