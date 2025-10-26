class Cat < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[id name age created_at updated_at]
  end
end
