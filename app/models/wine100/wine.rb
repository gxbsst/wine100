# encoding: utf-8
class Wine100::Wine < ActiveRecord::Base
	set_table_name :wine100_wines
	attr_accessible :name
end