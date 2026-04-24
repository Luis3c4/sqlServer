declare @json nvarchar(4000)
set @json = '
	{
		"name": "Luis",
		"Shopping": {
				"ShoppingTrip": 1,
				"Items": [
					{"Item":"Banana", "Cost":5},
					{"Item":"Apple", "Cost":4},
					{"Item":"Cherries", "Cost":3}
				]
		}
	}
'
--select ISJSON(@json) as IsValidJson
--select JSON_VALUE(@json, 'strict $.Shopping.Items[0].Item')
--select JSON_QUERY(@json, 'strict $.Shopping.Items[0]') as Item
--select json_modify(@json, 'strict $.Shopping.Items[0]', JSON_QUERY('{"Item": "Big bananas"}')) as Items
select * from OPENJSON(@json, ' $.Shopping.Items')with (
	item nvarchar(50) '$.Item',
	Cost int 
)

select 'Banana' as Item, 5 as Cost
UNION select 'Apple' as Item, 4 as Cost
UNION select 'Cherries' as Item, 3 as Cost
FOR JSON PATH