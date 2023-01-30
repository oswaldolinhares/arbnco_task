## Description

This Ruby on Rails application provides a solution for importing one or more .inp file extensions through a simple form. 

When a file is uploaded, it’s created a background process to store its data in the database. 
After all of this process one email is sent to notify the user. The user can see attached a link with the stored data.
It’s possible to download the file in the original .inp file too.

## Deployed
This application was deployed, using Heroku at https://arbnco.herokuapp.com/.

## Steps

To build this feature it was created a class called "UserSubmission” which contains the email and user files (stored with ActiveStorage). Validations were used to check the email format, presence, and the files content type.

After the upload is done, the ProcessFileWorker worker is triggered in background to store the file data.

To process the file is used the ProcessFile service class which handles file process in four steps:

* Convert the file data to a text format using the InptToHash service. Its result allows data manipulation for the next step.
* The Imports controller gets the parameters and stores the data, such as email and import fields (Import model).
* The third stage transforms the raw data stored in imports into information in the ObjectItem table, where you can view the structured data.
* Finally, the SendGridNotify email service is triggered to notify the user that the process has been completed.

## Navigation

The visualization structure for the sent information has been created, and you can view it by clicking on "imports" in the navbar.

Navigation provides you with the ability to:
View all completed imports, including information, email, and date.

In the "View All Imports" screen, you can click on "Show Import" to see the entire import, "Show Objects" to view all objects of that import, and also download the .inp file again.

In "Show Objects," you can see all objects and details of their properties in an organized manner.
I believe that I have accomplished all the objectives set out for the test.


## Notes
All the example files were tested (models, services, mailers and jobs)

The .inp files can be accessed at https://arbnco.herokuapp.com/imports/id.inp.

## Bonus tasks done
* Allowing the submission of multiple .inp files 
* Convert the stored database records to a .inp file again.
 
## To run the application  
```console
rails s && bundle exec sidekiq -q default -e development
```
