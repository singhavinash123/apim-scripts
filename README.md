# apim-scripts
# Running the script to generate Azure APIM service and api's

Pre-Requisite:
  PowerShell 7
  Azure Subscription

Agenda:
1.	Create APIM Service In Azure
2.	Create Product In The APIM Service
3.	Create User Group In the APIM Service
4.	Add Product To User Group
5.	Create API In APIM Service
6.	Add API’s To Product
7.	Add Policies In The Product
8.	Add Policies In the API’s
9.	Add Operations (CRUD) To The API’s

Step1:  Execute the given commands one by one in PowerShell (If installed PowerShell in your local system)

Install-module Az -AllowClobber -Force
Import-module Az


If you are using PowerShell environment with Azure Cloud Shell. Azure Cloud Shell is a browser-based shell environment that comes with the Az module installed and Enable-AzureRM compatibility aliases enabled, You don’t need to execute the above commands and also skip Step2.


 Step2: Execute the command given to Connect to your Azure Account.

 Connect-AzAccount

 

Copy the page url and access it in browser, it will ask code to be enter, Enter the code from the console.
 


Connect to your Azure Account








Step3: Create API with Policies using script.
A.	Open the CreateAPIMServiceAllMicroservices.txt  and replace  the details.

          Subscription id
          Your azure mail id,
          Location 
          Organization
 
$subscriptionId = "4eda8ef1-7525-49f9-9b47-b88f1eb27512" 
$adminEmail = "singhavi2020@outlook.com" 
$location = "Central US" 
$organisation = "OFSS"

B.	 Copy and paste the script into the PowerShell console.

It will take around 15-20 min to execute all the commands.

 



Verify your policies added to the api
 

Verify the product added to the APIM service
 

Verify the api is added to the product.
 



