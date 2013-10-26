class SecretTagging < ActiveRecord::Base
  attr_accessible :tag_id, :secret_id

  validates_uniqueness_of :tag_id, :scope => :secret_id, message: "duplicate tags"

  belongs_to :tag
  belongs_to :secret
end
