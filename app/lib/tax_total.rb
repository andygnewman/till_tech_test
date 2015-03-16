class TaxTotal

  attr_reader :tax_total

  def initialize(args)
    tax_rate = args[:tax_rate] || 0
    pre_tax_total = args[:pre_tax_total]
    @tax_total = (pre_tax_total * tax_rate / 100).round(2)
  end

end
