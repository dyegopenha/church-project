class HomeController < ApplicationController
  def index
    @incomes = Income.all.sum(:amount)
    @payments = Payment.all.sum(:amount)
    @balance = @incomes - @payments
  end
end
