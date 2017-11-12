Types::CategoryInfoType = GraphQL::ObjectType.define do
  name "CategoryInfo"

  field :gender do 
   type types.String
   resolve->(obj,args,cxt){
	obj["gender"]
   }
  end

  field :types do
   type types[Types::SubCategoryInfoType]
   resolve->(obj,args,cxt){
	obj["category"]	
   }
   end

end
