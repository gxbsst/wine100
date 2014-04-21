module Refinery
  module Wine100Profiles
    class Wine100Profile < ::Wine100::Profile

    	self.table_name = 'wine100_profiles'

      attr_accessible :company_name_en, :company_name_zh, :company_add, :company_phone, :company_website, :company_wines_count, :company_phone_area_code, :contact_name, :contact_job, :contact_phone, :contact_email, :finance_title, :finance_tax_num, :finance_add, :finance_name, :finance_phone, :wine100_user_id, :position

      acts_as_indexed :fields => [:company_name_en, :company_name_zh, :company_add, :company_phone, :company_website, :company_wines_count, :company_phone_area_code, :contact_name, :contact_job, :contact_phone, :contact_email, :finance_title, :finance_tax_num, :finance_add, :finance_name, :finance_phone]

    end
  end
end
