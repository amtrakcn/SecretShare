class SecretTagging < ActiveRecord::Base
  attr_accessible :tag_id, :secret_id

  belongs_to :tag
  belongs_to :secret
end
