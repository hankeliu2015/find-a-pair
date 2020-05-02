class Pair < ApplicationRecord
  belongs_to :requestor_user, class_name: "User"
  belongs_to :respondor_user, class_name: "User", optional: true

end
