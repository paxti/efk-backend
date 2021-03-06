class CategorySet < ActiveRecord::Base
  self.table_name = 'salesforce.i_m__category_set__c'
  
  has_many :category_entities, primary_key: "sfid", foreign_key: "i_m__to_category_set__c"
  has_one :configuration, primary_key: "sfid", foreign_key: "i_m__to_category_set__c"

  validates_presence_of :name, :sfid
end