class RequestEntity < ActiveRecord::Base
  self.table_name = 'salesforce.i_m__request_entity__c'

  belongs_to :request_bom, primary_key: 'i_m__externalid__c', foreign_key: 'i_m__to_request_bom__r__i_m__externalid__c'
  belongs_to :item, primary_key: 'sfid', foreign_key: 'i_m__to_item__c'
  
  validates_presence_of :i_m__amount__c, :item, :request_bom
  validates_numericality_of :i_m__amount__c, greater_than: 0

  scope :reserved_entities_by_item, ->(request_orders, item) { where(i_m__to_request_bom__c: request_orders, i_m__to_item__c: item.sfid) }
  scope :from_inventory, -> { where(i_m__provider__c: 'inventory') }

  def self.build_item_id_map(collection)
    collection.each_with_object(Hash.new) do |el, hash|
      hash.has_key?(el.i_m__to_item__c) ? hash[el.i_m__to_item__c] = hash[el.i_m__to_item__c] + el.i_m__amount__c : hash[el.i_m__to_item__c] = el.i_m__amount__c
    end
  end

end