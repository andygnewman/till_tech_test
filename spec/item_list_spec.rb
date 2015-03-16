require_relative '../app/lib/item_list'

describe 'item list' do

  it 'should return a list of items available to be ordered' do
    shop_name = 'The Coffee Connection'
    item_list = ItemList.new(shop_name)
    expect(item_list.items).not_to be_empty
  end

end
