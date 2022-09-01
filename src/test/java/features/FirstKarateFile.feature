Feature: Karate Beginning

  Scenario: Printing in Karate
    Given print "Hello Everyone"
    When print 'Hello Again'
    Then print ''Hello from Germany'

  Scenario: Continue printing
    Given print "How are you?"
    * print 'How are you everyone', "What is happening"
    * print '4 arti 5 esittiir ', 4+5, ' , 4 carpi 5 esittir ', 4*5

    # iki ayri ifadeyi virgülle aralarinda bir bosluk birakaark tek bir ifade olarak birlestirir

  Scenario: Defining Variables
    * def name = 'Mike'
    * print "Benim adim", name
    * print 'Benim adim ' + name
    * def age = 30
    * print name, age + ' yasinda'

  Scenario: Some Parameters
    * def student = {'name':'Ali', 'batch':'Batch 3'}
    * print student
    * print student.name
    * print student.batch
    #JSON : Java Script Object Notation


  Scenario: Json Object
    * def employee =
    """
    {
    'name': 'Nazan',
    'lastname': 'Nazli',
    'salary': '4000'
    }
    """
    * print employee
    * print employee.name
    * print employee.lastname
    * print employee.salary



  Scenario: Json Array Objects
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
    * print employees
    * print 'ilk calisanin ismi ',employees[0].name
    * print 'ikinci calisanin ismi ',employees[1].name
    * print 'ilk calisanin maasi ',employees[0].salary
    * print 'ikinci calisanin soyismi ',employees[1].lastname
