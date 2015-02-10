class RedirectMap < ActiveRecord::Base
  has_many :redirect_requests

  validates_uniqueness_of :src
end
