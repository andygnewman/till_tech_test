require 'json'

module FileRead

  def read_menu(shop_name)
    file = File.read('./hipstercoffee.json')
    menus = JSON.parse(file)
    @shop_menu = menus.select { |shop| shop["shopName"] = shop_name}.first
  end

end
