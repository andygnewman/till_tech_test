require_relative 'menu'
require_relative 'discount'
require_relative 'tax_total'


class Receipt

  attr_reader :tax_rate, :order

  include Menu
  include Discounts

  def initialize(order, tax_rate = 0)
    @tax_rate = tax_rate
    @order = order
    menu_read_price_list
  end

  def price_of(item)
    price_list[item]
  end

  def line_price(order_line)
    order_line[:quantity] * price_of(order_line[:item])
  end

  def net_total
    order.inject(0) { |memo, line| memo + line_price(line) }
  end

  def pre_tax_total
    net_total - discount_total
  end

  def tax_total
    args = {tax_rate: @tax_rate, pre_tax_total: pre_tax_total}
    TaxTotal.new(args).tax_total
  end

  def total_due
    pre_tax_total + tax_total
  end

  def print_receipt
    receipt = []
    order.each {|line| receipt <<
        "#{line[:item]} #{line[:quantity]} x #{'%.2f' % price_of(line[:item])}"}
    receipt << "Discount #{'%.2f' % discount_total}" if discount_total > 0
    receipt << "Tax #{'%.2f' % tax_total}"
    receipt << "Total #{'%.2f' % total_due}"
    return receipt
  end

end
