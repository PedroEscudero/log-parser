class Log < ActiveRecord::Base
  require 'file/tail'
  self.primary_key = :uuid
  validates :uuid, presence: true, allow_nil: false
end
