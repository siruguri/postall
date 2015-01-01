class RedirectRequest < ActiveRecord::Base
  belongs_to :redirect_map, counter_cache: true
end
