Types::LocalInfoType = GraphQL::ObjectType.define do
  name "LocalInfo"

  field :name do
	type types.String
	resolve -> (obj,args,cxt){
	   obj["name"]
	}
  end

  field :currency do
        type types.String
        resolve -> (obj,args,cxt){
           obj["currency"]
        }
  end

end
