# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Wine100Wines" do
    describe "Admin" do
      describe "wine100_wines" do
        login_refinery_user

        describe "wine100_wines list" do
          before do
            FactoryGirl.create(:wine100_wine, :style => "UniqueTitleOne")
            FactoryGirl.create(:wine100_wine, :style => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.wine100_wines_admin_wine100_wines_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.wine100_wines_admin_wine100_wines_path

            click_link "Add New Wine100 Wine"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Style", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Wine100Wines::Wine100Wine.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Style can't be blank")
              Refinery::Wine100Wines::Wine100Wine.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:wine100_wine, :style => "UniqueTitle") }

            it "should fail" do
              visit refinery.wine100_wines_admin_wine100_wines_path

              click_link "Add New Wine100 Wine"

              fill_in "Style", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Wine100Wines::Wine100Wine.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:wine100_wine, :style => "A style") }

          it "should succeed" do
            visit refinery.wine100_wines_admin_wine100_wines_path

            within ".actions" do
              click_link "Edit this wine100 wine"
            end

            fill_in "Style", :with => "A different style"
            click_button "Save"

            page.should have_content("'A different style' was successfully updated.")
            page.should have_no_content("A style")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:wine100_wine, :style => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.wine100_wines_admin_wine100_wines_path

            click_link "Remove this wine100 wine forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Wine100Wines::Wine100Wine.count.should == 0
          end
        end

      end
    end
  end
end
