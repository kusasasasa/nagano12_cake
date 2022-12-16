class OrderDetail < ApplicationRecord
     belongs_to :order, dependent: :destroy
     belongs_to :item, dependent: :destroy
     enum making_status:  { impossible: 0, wait: 1 , making: 2 , complete: 3 }
     
end
