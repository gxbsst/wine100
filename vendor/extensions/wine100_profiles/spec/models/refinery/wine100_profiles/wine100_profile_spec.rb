require 'spec_helper'

module Refinery
  module Wine100Profiles
    describe Wine100Profile do
      describe "validations" do
        subject do
          FactoryGirl.create(:wine100_profile,
          :company_name_en => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:company_name_en) { should == "Refinery CMS" }
      end
    end
  end
end
