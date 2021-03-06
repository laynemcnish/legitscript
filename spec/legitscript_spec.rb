require 'spec_helper'

describe LegitScript do

  before do
    @array = LegitScript.new
  end

  it "original function should return an empty array if given an empty array to start" do
    expect(@array.function([])).to eq([])
  end

  it "original function should return an empty array when given an array that has only unique values" do
    expect(@array.function([1,2,3]).sort).to eq([])
  end

  it "original function should return the values with duplicates when given an array with duplicated values" do
    expect(@array.function([1,1,2,2,3,3,4,5,6].sort)).to eq([1,2,3])
  end

  it "new method should return an empty array if given an empty array to start" do
    expect(@array.return_duplicated_values([]).sort).to eq([])
  end

  it "new method should return an empty array when given an array that has only unique values" do
    expect(@array.return_duplicated_values([]).sort).to eq([])
  end

  it "new method should return the values with duplicates when given an array with duplicated values" do
    expect(@array.return_duplicated_values([1,1,2,2,3,3,4,5,6]).sort).to eq([1,2,3])
  end

  it "new method should return the values with duplicates when given an array with duplicated values that are not in order" do
    expect(@array.return_duplicated_values([1,2,3,3,4,1,5,6,2]).sort).to eq([1,2,3])
  end

  it "new method should return the values with duplicates when given an unordered array" do
    expect(@array.return_duplicated_values([3,3,4,4,2,2,7,7,1,2,3,3,4,1,5,6,2]).sort).to eq([1,2,3,4,7])
    expect(@array.return_duplicated_values([10,2,4,4,2,2,4,7,1,2,3,8,10,1,5,6,2]).sort).to eq([1,2,4,10])
  end
end