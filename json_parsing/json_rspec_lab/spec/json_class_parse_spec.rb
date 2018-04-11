require 'spec_helper'

describe 'Testing the exchange rates' do

  before(:all) do
    @exchange_rates = ParseJson.new('json_exchange_rates.json')
  end

  it 'Should be a Hash' do
    expect(@exchange_rates.json_file).to be_kind_of(Hash)
  end

  it 'should contain the base as EUR' do
    # expect(@exchange_rates.json_file["base"]).to eql "EUR"
    expect(@exchange_rates.get_base_value).to eql "EUR"

    # expect(@exchange_rates.json_file).to include "base" => "EUR"
  end

  it "Should have a date string" do
    # expect(@exchange_rates.json_file["date"]).to be_a(String)
    expect(@exchange_rates.get_date_value).to be_a(String)

    # expect(@exchange_rates.json_file).to include "date"
  end

  it "should contain 31 rates" do
    expect(@exchange_rates.get_number_of_rate_key).to eq 31

    expect(@exchange_rates.get_number_of_rate_value).to eq 31

  end

  it "should all rates should be Floats" do
    @exchange_rates.get_rates_value.each do |k,v|
      expect(v).to be_a(Float)
    end
  end

end