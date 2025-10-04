declare @myOption as varchar(10)= 'Opcion C'

select case when @myOption = 'Option A' then 'First option'
			when @myOption = 'Option B' then 'Second option'
			else 'no option' end as MyOptions

declare @myOption2 as varchar(10) = 'Option B'
select ISNULL(@myOption2, 'no options') as Myoptions
go
declare @myFirsOptions as varchar(10)
declare @mySecondOptions as varchar(10)
select coalesce(@myFirsOptions,@mySecondOptions,'no options') as MyOptions
go