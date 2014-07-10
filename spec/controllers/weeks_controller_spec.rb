require 'rails_helper'

RSpec.describe WeeksController, :type => :controller do
  describe 'Should get the workout details from the model' do
    it 'Should build a Workout' do
      w1 = double(:workout)
      expect(Workout).to receive(:new).with(2, 300, 200).and_return(w1)
      get :show, :id=>2, :bs_1rm => 300, :fs_1rm => 200
    end
  end
end
