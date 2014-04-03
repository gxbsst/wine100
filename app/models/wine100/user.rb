# encoding: utf-8
class Wine100::User < ActiveRecord::Base

  set_table_name :wine100_users

  has_many :wines, :class_name => 'Wine100::Wine', :foreign_key => 'wine100_user_id', :order => 'created_at DESC', :include => [:varieties, :sale_chanels]
  has_one :profile, :class_name => "Wine100::Profile", :foreign_key => 'wine100_user_id', :dependent => :destroy

  attr_accessible :name, :password, :email, :password_confirmation, :builder_id, 
  :last_sign_in_at, :remember_created_at, :current_sign_in_ip, :last_sign_in_ip, 
  :position, :password_cleartext,
  :phone


  has_secure_password


  acts_as_indexed :fields => [:name, :password_digest, :email, 
    :password_cleartext, :current_sign_in_ip, :last_sign_in_ip]

  validates :email, :presence => true, :uniqueness => true

  validates :password, :presence => true, :on => :create

  before_validation :set_password

  validates :password, :confirmation => true

  # overwrite password
  def set_password
    self.password = self.password_cleartext
    # self.password_confirmation = self.password_cleartext
  end

  def profile_completed?
     profile.present? && profile.completed?
  end

  # WINES
  def finish_import!
    return false if !self.wines.present?
    self.wines.each(&:completed!)
    true
  end

  def finish_import?
    all_wines = self.wines
    return false if !all_wines.present?
    if all_wines.last.status
      true
    else
      false
    end
  end
end
