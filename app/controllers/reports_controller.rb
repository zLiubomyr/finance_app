class ReportsController < ApplicationController
  def index
    @operation = Operation.page(params[:page])
  end

  def report_by_category
    @by_categories = Operation.joins( :category )
                              .where( odate: params[:from_r]..params[:to_r] )
                              .group( 'categories.name' )
                              .sum(:amount )
  end

  def report_by_dates
    @operations = Operation.where( odate: params[ :from_r ]..params[:to_r ])
                           .group("DATE(odate)")
                           .sum(:amount ).map{| a, b | [ a.to_s, b]}
  end
end
