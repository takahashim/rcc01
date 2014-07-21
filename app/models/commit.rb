class Commit < ActiveRecord::Base
  belongs_to :repo
  has_one :build
end
