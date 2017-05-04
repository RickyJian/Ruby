class Log < ApplicationRecord
  belongs_to :candidate , counter_cache: true  ## 用來做一次搜尋
end
