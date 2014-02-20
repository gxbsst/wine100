class CreateTableWine100Profile < ActiveRecord::Migration
 def up
   create_table :wine100_profiles do |t|
     
     t.string :contact_name
     t.string :contact_job
     t.string :contact_phone
     t.string :contact_email

     t.string :company_name_en
     t.string :company_name_zh
     t.string :company_add
     t.string :company_phone
     t.string :company_website
     t.string :company_wines_count

     t.string :finance_title
     t.string :finance_tax_num
     t.string :finance_add
     t.string :finance_name
     t.string :finance_title
     t.string :finance_phone

     t.integer :wine100_user_id

     t.timestamps
   end

 end

 def down
   
   drop_table :wine100_users

 end
end
