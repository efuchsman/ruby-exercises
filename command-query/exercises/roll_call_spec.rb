require 'rspec'
require_relative 'roll_call'
require "pry"

RSpec.describe RollCall do
  it 'has no names' do
    roll_call = RollCall.new
    expect(roll_call.longest_name).to be nil
  end

  it 'has a longest of one' do
    roll_call = RollCall.new

    roll_call << 'Oda'
    # binding.pry
    expect(roll_call.longest_name).to eq('Oda')
  end

  it 'has longest of several' do
    roll_call = RollCall.new
    roll_call << "Ann"
    roll_call << "Alexandra"
    roll_call << "Roger"

    expect(roll_call.longest_name).to eq('Alexandra')
  end
end
