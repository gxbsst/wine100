require 'spec_helper'

module Refinery
  module Wine100Wines
    describe Wine100Wine do
      describe "validations" do
        subject do
          FactoryGirl.create(:wine100_wine,
          :style => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:style) { should == "Refinery CMS" }
      end
    end
  end
end
