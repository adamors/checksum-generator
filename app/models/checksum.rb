# Form object for checksum
class Checksum
  include ActiveModel::Model

  validates :text, presence: true

  attr_accessor :text
end
