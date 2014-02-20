# encoding: utf-8
class Wine100::User < ActiveRecord::Base
	 set_table_name :wine100_users
    
      has_one :profile, :class_name => "Wine100::Profile", :foreign_key => 'wine100_user_id'

      # def profile
      #   Wine100::Profile.find_or_initialize_by_wine100_user_id(self.id) || Wine100::Profile.new(:wine_user_id => self.id)
      # end


	attr_accessible :name, :password, :email, :password_confirmation, :builder_id, 
      :last_sign_in_at, :remember_created_at, :current_sign_in_ip, :last_sign_in_ip, 
      :position, :password_cleartext,
	  :phone


      has_secure_password


      acts_as_indexed :fields => [:name, :password_digest, :email, 
      :password_cleartext, :current_sign_in_ip, :last_sign_in_ip]

      # validates :name, :presence => true, :uniqueness => true

      validates :password, :presence => true, :on => :create

      before_validation :set_password

      validates :password, :confirmation => true

      # overwrite password
      def set_password
        self.password = self.password_cleartext
        self.password_confirmation = self.password_cleartext
      end

end