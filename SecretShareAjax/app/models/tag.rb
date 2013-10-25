class Tag < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true

  has_many :secret_taggings, class_name: 'SecretTagging'
  has_many :tagged_secrets, :through => :secret_taggings, :source => :secret
end
