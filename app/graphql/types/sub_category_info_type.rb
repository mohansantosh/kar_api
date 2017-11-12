Types::SubCategoryInfoType = GraphQL::ObjectType.define do
  name "SubCategoryInfo"

  field :category do
	type types.String
	resolve -> (obj,args,cxt){
	 obj.keys
	}
  end

  field :subcategory do
	type types[types.String]
        resolve -> (obj,args,cxt){
         obj.values
        }
  end
end
