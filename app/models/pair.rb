class Pair < ApplicationRecord
  belongs_to :requestor_user, class_name: "User"  #dafault foreignn key is user_id, this one is requestor_user_id
  belongs_to :respondor_user, class_name: "User", optional: true
  validates :title, length: {in: 10 ..100}
  validates :description, presence: true

  def accepted_by(user)
    if user == self.requestor_user
      self.errors.add(:respondor_user, " can not pair with yourself")
      return false
    else
      self.update(respondor_user: user)
    end
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

  def topic
    ActiveSupport::Deprecation.warn("Please user 'title' over 'topic'." )
    self.title
  end

end #end of class
