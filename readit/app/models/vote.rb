class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :story, counter_cache: true
end
