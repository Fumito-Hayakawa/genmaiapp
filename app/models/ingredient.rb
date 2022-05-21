class Ingredient < ApplicationRecord
  belongs_to :recipe
  #レシピ編集画面で、材料がupdate_at降順で並ぶのを防ぐため。
  default_scope -> { order(id: :asc) }
  validates :name, length: { maximum: 30 }
  validates :quantity, length: { maximum: 20 }
end
