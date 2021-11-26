class Product < ApplicationRecord
    belongs_to :cart, optional: true

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            # product = Product.find_by(row["id"])
            # product = Product.find_by_id([:id])
            # if product.present?
                # next
            # else
                # Product.create! row.to_hash
                Product.find_or_create_by row.to_hash
            # end
        end
    end
    
end
