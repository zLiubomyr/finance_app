class ReportsController < ApplicationController
  def index
    @operation = Operation.page(params[:page])
  end

  def report_by_category
    @by_categories = Operation.joins( :category )
                              .where( odate: params[:start_date]..params[:end_date] )
                              .group( 'categories.name' )
                              .sum(:amount )
  end

  def report_by_dates
    @operations = Operation.where( odate: params[ :start_date ]..params[:end_date ])
                           .group("DATE(odate)")
                           .sum(:amount ).map{| a, b | [ a.to_s, b]}
  end
end
