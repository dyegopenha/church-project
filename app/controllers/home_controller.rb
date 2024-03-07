class HomeController < ApplicationController
  def index
    @income_sum_by_month = Income.group_by_month(:when, range: 5.months.ago..Time.now).sum(:amount)
    @income_sum_by_kind = Income.group(:kind).sum(:amount)

    @payment_sum_by_month = Payment.group_by_month(:when, range: 5.months.ago..Time.now, format: "%b %Y").sum(:amount)
    @payment_sum_by_kind = Payment.group(:kind).sum(:amount)

    @balance = Income.all.sum(:amount) - Payment.all.sum(:amount)
  end
end
