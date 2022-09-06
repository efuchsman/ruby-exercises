# frozen_string_literal: true

RSpec.describe 'count test' do
  it 'words with e' do
    words = %w[thing phone bark belt shoe bath]
    tally = words.count do |word|
      word.include?('e')
    end
    expect(tally).to eq(3)
  end

  it 'numbers greater than 17' do
    numbers = [9, 18, 12, 17, 1, 3, 99]
    tally = numbers.count do |number|
      number > 17
    end
    expect(tally).to eq(2)
  end

  it 'words that are uppercase' do
    words = %w[trousers SOCKS sweater Cap SHOE TIE]
    tally = words.count do |word|
      word == word.upcase
    end
    expect(tally).to eq(3)
  end

  it 'words ending in ing' do
    words = %w[thought brake shin juice trash]
    tally = words.count do |word|
      word.chars.last(3) == %w[i n g]
    end
    expect(tally).to eq(0)
  end

  xit 'even numbers' do
    numbers = [9, 2, 1, 3, 18, 39, 71, 4, 6]
    # Your code goes here
    expect(tally).to eq(4)
  end

  xit 'multiples of 5' do
    numbers = [2, 5, 19, 25, 35, 67]
    # Your code goes here
    expect(tally).to eq(3)
  end

  xit 'round prices' do
    prices = [1.0, 3.9, 5.99, 18.5, 20.0]
    # Your code goes here
    expect(tally).to eq(2)
  end

  xit 'four letter words' do
    words = %w[bake bark corn apple wart bird umbrella fart]
    # Your code goes here
    expect(tally).to eq(6)
  end
end
