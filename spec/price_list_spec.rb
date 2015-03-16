require_relative '../app/lib/price_list'

describe 'price list' do

  let(:price_list) { PriceList.new('The Coffee Connection') }

  it 'should have items loaded' do
    expect(price_list.prices).not_to be_empty
  end

  it 'should have prices against each item' do
    expect(price_list.prices.keys.length).to eq(price_list.prices.values.length)
  end

end
