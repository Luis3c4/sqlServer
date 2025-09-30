select convert(char(11),  'hello') as gretting
union all --intersec except
select convert(char(11),  'bonjour')

use Udemi
select *, Row_Number() over(order by(select null)) % 3 as ShouldDelete
from [dbo].[tblTransaction]