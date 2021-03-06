class CategoryEntity < ActiveRecord::Base
  self.table_name = 'salesforce.i_m__category_entity__c'
  
  belongs_to :category_set, primary_key: 'sfid', foreign_key: 'i_m__to_category_set__c'
  belongs_to :category, primary_key: 'sfid', foreign_key: 'i_m__to_category__c'
 
  validates_presence_of :sfid, :name, :category_set, :category 
end
