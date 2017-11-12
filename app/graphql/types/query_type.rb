Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :get_locale  do
    type types[Types::LocalInfoType]
    description "Get info of available locale information"
    resolve ->(obj, args, ctx) {
	local_info = []
	india = {}
	us = {}
 	india["name"] = "India"
	india["currency"] = "Rs"
	local_info << india
	us["name"] = "United States of America"
	us["currency"] = "$"
	local_info << us
	local_info
    }
end

  field :get_category_info do
    type types[Types::CategoryInfoType]
    argument :gender, types.String
    description "Get all the info"
    resolve ->(obj, args, ctx) {
      catalog_info = []
      men = {}
      women = {}
      men["gender"] = "Men"
      men["category"] = [{"Topwear" => ["Casual Shirts","T-Shirts","Formal Shirts"]},{"Bottomwear" => ["Jeans","Casual Trousers","Format Trousers"]},{"Footwear" => ["Casual Shoes","Sport Shoes"]},{"SunGlasses" => []}]
      catalog_info << men
      
      women["gender"] = "Women"
      women["category"] = [{"Indian and Fusion Wear" => ["Kurtas","Kurtis","Skirts"]},{"Westwear" => ["Jumpsuits","Tops","Jeans"]},{"Footwear" =>["Flat","Heals"]},{"SunGlasses" => []}]
      catalog_info << women
      if args["gender"].present?
	catalog_info.each do |type|
	 if type["gender"] == args["gender"]
	  catalog_info = []
	  catalog_info << type
	  break
	 end
        end
     end
       catalog_info
    }
  end
end
