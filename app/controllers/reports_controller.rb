class ReportsController < ApplicationController
  def index
    @operation = Operation.page(params[:page])
  end

  def report_by_category
    # @from_d =
    # @to_d
    # @to_chart=Operation.select(:categories.name).joins(:category).where(odate: params[:from_r] .. params[:to_r]).group(:categories.name).sum(:amount)

  end

  def report_by_dates
    @to_chart=Operation.select(:categories.name).joins(:category).where(odate: params[:from_r] .. params[:to_r]).group(:categories.name).sum(:amount)
  end
end
