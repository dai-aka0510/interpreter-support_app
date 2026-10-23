class ReceiptsController < ApplicationController
  before_action :set_project
  before_action :set_receipt, only: [ :edit, :update, :destroy ]

  def new
    @receipt = @project.receipts.build
  end

  def create
    @receipt = @project.receipts.build(receipt_params)
    if @receipt.save
      redirect_to project_path(@project), notice: "領収証を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @receipt.update(receipt_params)
      redirect_to project_path(@project), notice: "領収証を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @receipt.destroy
    redirect_to project_path(@project), status: :see_other, notice: "領収証を削除しました。"
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_receipt
    @receipt = @project.receipts.find(params[:id])
  end

  def receipt_params
    params.require(:receipt).permit(:title, :amount, :issued_date, :account_item, :memo, :image)
  end
end
