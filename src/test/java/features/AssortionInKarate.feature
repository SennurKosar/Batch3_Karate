Feature: Assertion using "match" keyword


  Scenario: matching examples
    * def employee =
    """
    {
    'name': 'Nazan',
    'lastname': 'Nazli',
    'salary': '4000'
     }
    """
    * def employee_firstname = employee.name
    * match employee_firstname == 'Nazan'
    * print employee_firstname
    * print employee_firstname == 'Nazan'
    * match employee.lastname != 'Nazlii'
    * match employee.salary == '4000'



  Scenario: Fuzzy matching
    * def employee =
    """
    {
    'name': 'Nazan',
    'lastname': 'Nazli',
    'salary': 4000
     }
    """
    * match employee.name == '#string'
    * match employee.lastname != '#number'
    * match employee.salary == '#number'
    * match employee.lastname == '#present'
    * match employee.father_name == '#notpresent'



  Scenario: Matching using "contains" method
    * def employees =
   """
    [
     {
    'name': 'Nazan',
    'lastname': 'Nazli',
    'salary': '4000'
     },
     {
    'name': 'Ali',
    'lastname': 'Veli',
    'salary': '3500'
     }
    ]
    """
    * def length = employees.length
    * print 'length is', length
    * match length == 2
    * match employees contains {'name': 'Ali','lastname': 'Veli','salary': '3500'}

