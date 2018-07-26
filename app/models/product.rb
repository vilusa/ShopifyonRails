class Product < ApplicationRecord
	#has_many durumunda 's  (ex:variants) eklenir
	has_many :variants
end
