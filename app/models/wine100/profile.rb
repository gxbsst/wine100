# encoding: utf-8
class Wine100::Profile < ActiveRecord::Base

	set_table_name :wine100_profiles

      belongs_to :user, :class_name => 'Wine100::User', :foreign_key => 'wine100_user_id'

	attr_accessible :contact_name, :contact_job,
      :contact_phone,
      :contact_email,

      :company_name_en,
      :company_name_zh,
      :company_add,
      :company_phone,
      :company_website,
      :company_wines_count,

      :finance_title,
      :finance_tax_num,
      :finance_add,
      :finance_name,
      :finance_phone,

      :wine100_user_id

      #validates :contact_name, :contact_phone, :contact_email, :presence => true, :on => :create
      validates :company_name_zh, :company_add, :company_phone, :presence => true, :on => :create

      # after_create do 
      #   self.user.update_attribute(:is_completed, true)
      # end

      def completed?
         contact_completed? && company_completed? && finance_completed?
      end

      def contact_completed?
         contact_name? && contact_email? && contact_phone? 
      end

      def company_completed?
        company_name_en? && company_name_zh && company_add? && company_phone? && company_website? && company_wines_count?
      end

      def  finance_completed? 
        finance_title? && finance_tax_num? && finance_add? && finance_name? && finance_phone? 
      end
end
