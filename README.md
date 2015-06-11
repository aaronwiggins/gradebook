#Gradebook
This is an app that will allow teachers, parents and students to track grades. each class.

##Overview
This app has three users that will be using this program; teachers, students, and parents. Based on the login authentication, users will be taken to a "dashboard" which corresponds to their account type (ie teacher).

Teachers are given access to create new teachers, create and edit grades for their students, create new students associated with them, and create parents which belong to their students. Students are only able to view their grades. Parents are only able to view their students grades. Any user will be able to edit their password if they choose to.

##ERD
[Here](https://www.lucidchart.com/invitations/accept/ef6a3970-8af3-4dc2-ba61-b1cf6120a8c5)

##To Run via Terminal...
* Click [here](https://github.com/aaronwiggins/gradebook.git) to clone the repository to your computer
* Once in the projects root directory, in the terminal type:
    * bundle install
    * bin/rake db:migrate
    * bin/rake db:seed
        * can run bin/rake db:setup in-place of the previous 2
    * bin/rails server
    * Open your browser and navigate to localhost:3000/sessions/login

###Addtional Notes
As of 6/11/2015 this assignment is still a work-in-progress.
