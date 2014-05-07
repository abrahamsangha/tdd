require 'spec_helper'
require 'rspec/its'

describe Location do
	let(:latitude) { 38.911268 }
	let(:longitude) { -77.444243 }
	let(:air_space) { Location.new(latitude: 38.911268, longitude: -77.444243) }

	describe '#initialize' do
		# it 'sets the latitude and longitude' do
		# 	loc = Location.new(latitude: 38.911268, longitude: -77.444243)
		# 	expect(loc.latitude).to eq 38.911268
		# 	expect(loc.longitude).to eq -77.444243
		# end
		# REFACTORED TO BELOW; 'ITS' CREATES NESTED EXAMPLE GROUP
		subject { air_space }
			its (:latitude) { should == 38.911268 } 
			its (:longitude) { should == -77.444243 } 
	end

	describe '#near?' do
		context 'when within specified radius' do
			subject { air_space }
				it { should be_near(latitude, longitude, 1) }
		end

		context 'when outside the specified radius' do
			subject { air_space }
				it { should_not be_near(latitude * 10, longitude * 10, 1) }
		end

		context 'when a negative radius is used' do
			it 'raises an error' do
				expect { air_space.near?(latitude, longitude, -1) }.to raise_error ArgumentError
			end
		end
	end

end