module MoneyHelper
  def currency(money)
    number_to_currency(money, unit: '£')
  end
end