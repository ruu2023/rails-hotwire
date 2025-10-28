class Cat < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[id name age created_at updated_at]
  end

  # 名前: 必須
  validates :name, presence: true,length: { maximum: 10 }, # 例: 最大50文字
      format: {
        with: /\A[\p{hiragana}\p{katakana}ー－]+\z/,
        message: "は、ひらがなまたはカタカナで入力してください"
      }
  # 年齢: 必須 + integer + 0 以上
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
