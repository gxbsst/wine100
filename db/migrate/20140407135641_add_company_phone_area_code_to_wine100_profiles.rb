class AddCompanyPhoneAreaCodeToWine100Profiles < ActiveRecord::Migration
  def change
    add_column :wine100_profiles, :company_phone_area_code, :string
  end
end
