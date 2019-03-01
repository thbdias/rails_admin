class ProductQuantity < ApplicationRecord
  belongs_to :product
  belongs_to :user #não tem no tutorial...gerado automaticamente  
  belongs_to :sale, optional: true
end
