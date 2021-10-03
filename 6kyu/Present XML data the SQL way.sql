"""All tasks come from www.codewars.com"""

"""Task
Given the database where all the users' data is stored in one huge XML
string, fetch it as separate rows and columns.

Notes
The private field determines whether the user's email address should be publicly visible
If the profile is private, email_address should equal "Hidden"
The users may have multiple email addresses
If no email addresses are provided, email_address should equal "None"
If there're multiple email addresses, the first one should be shown
The date_of_birth is in the yyyy-mm-dd format
The age fields represents the user's age in years
Order the result by the first_name, and last_name columns

Input table
-------------------------
| Table | Column | Type |
|-------+--------+------|
| users | id     | int  |
|       | data   | xml  |
-------------------------

XML format
<data>
    <user>
        <first_name>...</first_name>
        <last_name>...</last_name>
        <date_of_birth>...</date_of_birth>
        <private>...</private>
        <email_addresses>
            <address>...</address>
            <address>...</address>
            ...
            <address>...</address>
        </email_addresses>
    </user>
    <user>...</user>
    ...
    <user>...</user>
</data>

Output table
------------------------
|    Column     | Type |
|---------------+------|
| first_name    | text |
| last_name     | text |
| age           | int  |
| email_address | text |
------------------------
"""

select
(xpath('/user/first_name/text()', data))[1]::text as first_name,
(xpath('/user/last_name/text()', data))[1]::text as last_name,
date_part('year', age(((xpath('/user/date_of_birth/text()', data))[1]::text)::date))::int as age,
case
when (xpath('/user/private/text()', data))[1]::text = 'true' then 'Hidden'
when not xpath_exists('/user/email_addresses/address', data) then 'None'
else (xpath('/user/email_addresses/address/text()', data))[1]
end as email_address
from unnest(xpath('/data/user', (select data from users limit 1))) as data
order by first_name, last_name;
