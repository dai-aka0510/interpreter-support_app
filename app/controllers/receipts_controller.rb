class ReceiptsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @receipt = @project.receipts.build
  end

  def create
    @project = Project.find(params[:project_id])
    @receipt = @project.receipts.build(receipt_params)

    if @receipt.save
      redirect_to project_path(@project), notice: "領収証を登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    redirect_to project_path(params[:project_id]), notice: "領収証を削除しました！"
  end

  private

  def receipt_params
    params.require(:receipt).permit(:title, :amount, :issued_date, :account_item, :memo)
  end
end
