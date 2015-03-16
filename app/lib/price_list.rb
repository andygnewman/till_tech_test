require_relative 'file_read'

class PriceList

  include FileRead

  attr_reader :prices

  def initialize(shop_name)
    @prices = read_menu(shop_name)["prices"].first
  end

end
