class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups
  def dateupdated
    return updated_at.strftime("%B %e, %Y")
  end

  def full_name
    full_name = "#{first_name} #{middle_name} #{last_name}"
  end

  def search_all
  value = params[:search]
    Contact.where("middle_name LIKE ? OR phone_number LIKE ? OR email LIKE", "%#{value}%", "%#{value}%", "%#{value}%")
  end

end
