require_relative 'file_read'

class ItemList

  include FileRead

  attr_reader :items

  def initialize(shop_name)
    @items = read_menu(shop_name)["prices"].first.keys
  end

end
