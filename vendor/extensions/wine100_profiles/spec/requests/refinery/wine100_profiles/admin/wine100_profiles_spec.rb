# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Wine100Profiles" do
    describe "Admin" do
      describe "wine100_profiles" do
        login_refinery_user

        describe "wine100_profiles list" do
          before do
            FactoryGirl.create(:wine100_profile, :company_name_en => "UniqueTitleOne")
            FactoryGirl.create(:wine100_profile, :company_name_en => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.wine100_profiles_admin_wine100_profiles_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.wine100_profiles_admin_wine100_profiles_path

            click_link "Add New Wine100 Profile"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Company Name En", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Wine100Profiles::Wine100Profile.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Company Name En can't be blank")
              Refinery::Wine100Profiles::Wine100Profile.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:wine100_profile, :company_name_en => "UniqueTitle") }

            it "should fail" do
              visit refinery.wine100_profiles_admin_wine100_profiles_path

              click_link "Add New Wine100 Profile"

              fill_in "Company Name En", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Wine100Profiles::Wine100Profile.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:wine100_profile, :company_name_en => "A company_name_en") }

          it "should succeed" do
            visit refinery.wine100_profiles_admin_wine100_profiles_path

            within ".actions" do
              click_link "Edit this wine100 profile"
            end

            fill_in "Company Name En", :with => "A different company_name_en"
            click_button "Save"

            page.should have_content("'A different company_name_en' was successfully updated.")
            page.should have_no_content("A company_name_en")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:wine100_profile, :company_name_en => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.wine100_profiles_admin_wine100_profiles_path

            click_link "Remove this wine100 profile forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Wine100Profiles::Wine100Profile.count.should == 0
          end
        end

      end
    end
  end
end
