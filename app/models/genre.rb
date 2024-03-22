class Genre < ApplicationRecord
  validates :name, presence: { message: "を選択してください" }
end
