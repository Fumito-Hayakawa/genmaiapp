class Ingredient < ApplicationRecord
  belongs_to :recipe
  #レシピ編集画面で、材料がupdate_at降順で並ぶのを防ぐため。
  default_scope -> { order(id: :asc) }
end
