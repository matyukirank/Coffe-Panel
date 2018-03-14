# Coffe-Panel (Order Panel)

Coffee panel on ordering progressive web application that allows users to order different beverages and have their order logged on a kitchen page. It also has administrative capabilities which include restocking of different beverages and deletion of other pending or completed orders

The application makes use of Angular, Asp.net  core and SQL server. 

# The following applications are must be installed to run the application. 

Nodejs v 8.7.0 +
Angular installed globally
Visual Studio 2017
Visual studio code ( Text editor) 
SQL server 2017 
Modern Browser

# To begin with install Node.js and angular from the fall of websites 

https://nodejs.org/en/ 
https://angular.io/guide/quickstart 

# The application makes use of a .Net core, therefore, you have to have the framework installed alongside Visual Studio 2015 or 2017 ( vs code is also recommended as a text editor )

https://dotnet.github.io 
https://code.visualstudio.com 
https://www.visualstudio.com/vs/whatsnew/

# Now install SQL server 2017 including the server management studio

https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms 
https://www.microsoft.com/en-us/sql-server/sql-server-2017 


# Setup Database

Run the OrderPanel.sql query in SQL server and fill in data. 
Alternatively -> Import the database data from the files inside SQLDATA.zip ( HELP -> https://docs.microsoft.com/en-us/sql/relational-databases/databases/attach-a-database )

# Setup web API 

Open OrderApi.sln and edit the SQL connection script in the following 
AuthGuardDataProvider.cs
OrderDataProvider.cs
Product data provider.cs
OrderPanelContext.cs
With this script -> “Server=DESKTOP-CVKC6GP\SQLEXPRESS;Database=OrderPanel;Trusted_Connection=True;”
Restore nuget packages if necessary 
Then run the application ( F5 ) 

# Setup Angular (client side) 

Inside the OrderApi.zip file, there is an OrderPanel folder where you will find the angular application excluding the node modules.
Open the OrderPanel folder using Visual Studio code, then using CMD or  the included terminal Run the following commands
Npm install ( restore the node modules )
Ng serve ( to run the angular application in development mode ) 
Navigate to http://localhost:4200/ in your browser



