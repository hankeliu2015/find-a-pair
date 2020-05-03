class Pair < ApplicationRecord
  belongs_to :requestor_user, class_name: "User"
  belongs_to :respondor_user, class_name: "User", optional: true

  def accepted_by(user)
    self.update(respondor_user: user)
  end

  def accepted?
    true if respondor_user
  end

end #end of class
