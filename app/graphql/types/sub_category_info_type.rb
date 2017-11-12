Types::SubCategoryInfoType = GraphQL::ObjectType.define do
  name "SubCategoryInfo"

  field :category do
	type types.String
	resolve -> (obj,args,cxt){
	 obj.keys[0]
	}
  end

  field :subcategory do
	type types[types.String]
        resolve -> (obj,args,cxt){
         obj.values[0]
        }
  end
end
