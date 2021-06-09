require "station"
describe Station do 
  it "station can expose the name" do
  station = Station.new
  expect(station.name).to eq "Bond"
  end 
  it "station can expose the zone" do
    station = Station.new
    expect(station.zone).to eq(4)
  end 
end 