class ContactGroup < ApplicationRecord
  belongs_to :Contact, optional:true
  belongs_to :group, optional:true
end
