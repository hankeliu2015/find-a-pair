class Pair < ApplicationRecord
  belongs_to :requestor_user, class_name: "User"
  belongs_to :respondor_user, class_name: "User", optional: true

  def accepted_by(user)
    self.update(respondor_user: user)
  end

  def accepted?
    true if respondor_user
  end

  def self.by_status(status)
    case status
    when :open
      where(respondor_user: nil)
    when :active
      where.not(respondor_user: nil)
    end

  end

end #end of class
