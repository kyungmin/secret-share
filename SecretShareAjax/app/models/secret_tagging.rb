class SecretTagging < ActiveRecord::Base
  attr_accessible :secret_id, :tag_id
  validates :secret_id, :tag_id, presence: true

  belongs_to :secret, class_name: 'Secret'
  belongs_to :tag, class_name: 'Tag'

end
