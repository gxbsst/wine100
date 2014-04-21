class CreateWine100ProfilesWine100Profiles < ActiveRecord::Migration

  def up
    create_table :refinery_wine100_profiles do |t|
      t.string :company_name_en
      t.string :company_name_zh
      t.string :company_add
      t.string :company_phone
      t.string :company_website
      t.string :company_wines_count
      t.string :company_phone_area_code
      t.string :contact_name
      t.string :contact_job
      t.string :contact_phone
      t.string :contact_email
      t.string :finance_title
      t.string :finance_tax_num
      t.string :finance_add
      t.string :finance_name
      t.string :finance_phone
      t.integer :wine100_user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-wine100_profiles"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/wine100_profiles/wine100_profiles"})
    end

    drop_table :refinery_wine100_profiles

  end

end
