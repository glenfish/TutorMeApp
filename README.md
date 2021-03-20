# TutorMe 
![](https://i.imgur.com/WRZL1NI.jpg)

### Tech Stack:  
* HTML5
* CSS3 / SCSS
* Bootstrap 4.6
* PostgreSQL
* Javascript
* Ruby v 3.0.0
* Rails v 6.1.3
* PostgreSQL

### 3rd Party Services
* Cloudinary
* Stripe
____
## Live app:  

This app is hosted with Heroku:  
[https://tutorme-app.herokuapp.com](https://tutorme-app.herokuapp.com)

____
## Github repo:  
[https://github.com/glenfish/TutorMeApp](https://github.com/glenfish/TutorMeApp)

____
## Install:  
```git clone https://github.com/glenfish/TutorMeApp.git```

Run: ```bundle install```

Create Database: ```rails db:create```

Migrate: ```rails db:migrate```

____
## Gems Used:

### Authentication / Authorisation
```gem 'devise'```

### Image Hosting
```gem 'cloudinary'```  
```gem 'activestorage-cloudinary-service'```

### Payment Processing
```gem 'stripe'```

___
## What is TutorMe?  

* A two-sided marketplace matching students with tutors

* Tutors can create a profile and list subjects they teach, and receive payment for their time

* Students can search for tutors teaching subjects of interest, and book tutoring time

* Payments are made via Stripe API integration

This app is simple to use and with quick account creation process, students and tutors can be in touch and having an online Zoom meeting or Skype call. Once a successful payment and booking has been made, both parties are supplied with the other's contact information. It is then up to the participants to arrange and execute the online tutoring time via an appropriate web conferencing service. (Note: Conferencing services are not supplied by TutorMe.)

___
## Identifying A Need For The App 

As a fulltime student since early 2020 at university, I found a need to reach out to an expert in a specific technical area - IT networking. Luckily, I knew a person who was able to assist.

The experience got me thinking about a broader solution. One that I could perhaps use in the future to find one-on-one training with an expert in any field of study or vocation.

With Covid-19, lockdowns and job losses, people with experience are looking for ways to generate income. Mentoring/Tutoring is a perfect area to target for a web-based application. 
___
## Target Audience 

TutorMe is a service that brings together teaching talent and those who have a need for one-on-one training. Students at university, community college, self-studying or doing bootcamps can all benefit from having an expert on hand who can help their learning journey. Mentors/Tutors can find value in teaching and providing assistance to those in need while deriving an income stream on their own time schedule.
___
## Current Functionality
This version is a Minimum Viable Product (MVP). There are many features yet to be added to build this out into a fully functional marketplace. As of right now, Tutors can create subjects and set the number of hours they can dedicate to tutoring for each subject. All bookings are tracked and logged in the bookings page with total earned.

Students can search for tutors based on subject, subject hours available, state, country, firstname and lastname. They can favourite tutors to create a shortlist for easy recall within their account, and can book tutors 1 hour at a time. Again, student can see all their billing history.
___
## Limitations
Payment to tutors bank account is not currently available in this version of the app. However this can be done outside of the system using Stripe reports and invoices.

Hours booked is currently hard coded to 1 hour blocks.

One hour is currently billed at $60 AUD.
____
## Trello board:  
[https://trello.com/b/pKYN5mPa/tutorme-app](https://trello.com/b/pKYN5mPa/tutorme-app)
* User stories
* Bugfixes
* App development tracking
* Functional checklists

Tasks were defined early in the project and set up in columns identifying core functionality (or donuts) and optional/additonal features (known as sprinkles). Items were created as cards in these lists and arranged in order of importance, or build order. Some were given checklists within the task if there were many components or processes, such as creating, testing, associatings, sanitising and integrating the models with the app. These were checked off as they were completed.

Similarly, bugs were added to the buglist as they were encountered, and removed as they were addressed. 

A 'Working On' list was created for jobs that were currently being coded. This ensured that development was focused. Once it was working, it was tested with data in localhost via the Puma rails server.

Ultrahooks was used in the testing of the Stripe web hooks once the checkout was integrated. This required post data to be read from a controller action and the appropraite models updated to reflect the payment, booking, tutor, student, subject, number of hours purchased, and decrement the hours in the subject model for the associated tutor.

*All snapshots of Trello board in 'docs/trello_snapshots' folder*
___
## User Stories
### The following user stories are implemented in the code 
![User Stories #2](https://i.imgur.com/pUvYukN.png)
![User Stories #1](https://i.imgur.com/PwEN3eQ.png)


*All images are in 'docs/user_stories' folder*
___
## Testing

Rails console was used for testing all model behaviour. Below are two such tests conducted on the Students / Tutors / Subjects / Bookings model associations and the Bookings / Payments model associations.

Tutor, Student & Subject objects used for console tests:  

harold = Tutor.first  

	harold.id `# 1`  
    
joe = Student.first  

	joe.id `# 1`  

subject = harold.subjects.find(5)  

	subject.id `# 5` 

	subject.title `# "diving"`  

	subject.time `# 52`  


1. Create a record in *Bookings* model based on the above data:
booking_2 = joe.bookings.create(tutor_id: harold.id, time: 1,subject_id: subject.id)
test:  
```
booking_2.tutor.firstname # "Harold"  

booking_2.student.firstname # "Joe"  

booking_2.subject.title # "diving"

booking_2.subject.time # 52

booking_2.time # 1

booking_2.id # 1
```

joe.bookings 

```
[#<Booking id: 1, time: 1, tutor_id: 1, student_id: 1, subject_id: 5, created_at: "2021-03-13 02:06:56.329396000 +0000", updated_at: "2021-03-13 02:06:56.329396000 +0000">, #<Booking id: nil, time: 1, tutor_id: 1, student_id: 1, subject_id: 5, created_at: nil, updated_at: nil>]
```

harold.bookings  

```
[#<Booking id: 1, time: 1, tutor_id: 1, student_id: 1, subject_id: 5, created_at: "2021-03-13 02:06:56.329396000 +0000", updated_at: "2021-03-13 02:06:56.329396000 +0000">]
```

## *All console tests passed.*  

2. Create a record in *Payments* based on the Booking data:

payment_2 = Payment.create(amount: 40, booking_id: booking_2.id)
```
payment_2.amount `# 40`
```

The Bookings and Payments models are set up and working as expected, tested via the Rails console.

![Testing #1](https://i.imgur.com/fFaeUCi.png)  
![Testing #2](https://i.imgur.com/2oDtNIP.png)  
![Testing #3](https://i.imgur.com/AEuE76P.png)  
![Testing #4](https://i.imgur.com/4vVZHUJ.png)  

*All testing screenshots are in 'docs/testing' folder*
____
## Entity Relationship Diagram (ERD):  
![https://i.imgur.com/LNgGpUJ.png](https://i.imgur.com/LNgGpUJ.png)

___
## Schema:

The schema file was generated from multiple migration files using `rails db:migrate`

1. Created subjects model from the command line  
`rails g model subjects time:integer tutor:references`

2. Added the associations to the model file
```
subjects.rb
has_many :tutors
has_one :photo
tutors.rb
has_many :subjects
```

Similarly, other models were created:   

Bookings Model  
`rails g model booking time:integer tutor:references student:references subject:references`

Payments Model  
`rails g model payment amount:integer booking:references`

The `modelname:references` sets up the foreign key association on the new model with the already existing model *'modelname'*

Some fields needed to have 'not null' defined on them after they were created, to ensure that they have a value and are not blan in the database table. This was done again on the command line and then in the migration file, as follows:


`rails g migration AddChangeColumnNullTo<Modelname>`  
then in the migration file:  
`change_column_null(:<modelname>, :field, false)`


### Example 1:

`rails g migration AddChangeColumnNullToTutors`
```
and then in the migration file:
change_column_null(:tutors, :firstname, false)
change_column_null(:tutors, :lastname, false)
change_column_null(:tutors, :address_1, false)
change_column_null(:tutors, :state, false)
change_column_null(:tutors, :country, false)
change_column_null(:tutors, :postcode, false)
```

### Example 2:

`rails g migration AddChangeColumnNullToStudents`

```
change_column_null(:students, :firstname, false)
change_column_null(:students, :lastname, false)
```

Validations were set up on models using the following syntax in the model class
```
validates :email, presence: true  
validates :firstname, presence: true  
validates :lastname, presence: true  
validates :address_1, presence: true  
validates :postcode, presence: true  
validates :state, presence: true  
validates :country, presence: true  
```

## Associations

The Students model for example has the following association definitions in its model class file: A Student can have many Tutors, through the Favourites table.
```
has_many :favourites
has_many :tutors, through: :favourites
```
And a successful payment is a one to one relationship with a booking, which is a through association
```
has_one :payment, through: :bookings
```

![Schema #1](https://i.imgur.com/u2DtQTH.png)  
![Schema #2](https://i.imgur.com/mOZnPgB.png) 
![Schema #3](https://i.imgur.com/kz0kS6c.png) 


*All schema screenshots are in 'docs/schema' folder*

___
## Abstraction

The Devise gem and its bcrypt core largely abstract the authentication and authorization processes by providing method calls to handle all the critical functionality required. One example is:

`before_action :authenticate_tutor!`

This runs on all controller actions where it is permitted, and ensures that we can then use:

`tutor_signed_in?`

... to set the tutor object, profile and array of subjects available to all views.

Another example of abstraction is custom methods created in controller helpers to build the booking history. A simple method call to `get_student_booking_info(booking)` returns an html/ruby formatted booking card for display.

____
## Wireframes:  
[Google Slides Presentation](https://docs.google.com/presentation/d/1NYTVL6BqujK6xx0A7tb3AlOUhXK7OC8ULvy7KSxVTQ4/edit?usp=sharing)

![Home Page - index](https://i.imgur.com/AEfiRBu.png)  
![Home Page - sign in](https://i.imgur.com/GZGz9zc.png)  
![Home Page - sign up](https://i.imgur.com/5VPXnSy.png)  
![STUDENT - Search](https://i.imgur.com/Vt0v7Ib.png)  
![STUDENT - Search Results](https://i.imgur.com/l4KKRdA.png)  
![STUDENT - Tutor Profile](https://i.imgur.com/xrbvWb5.png)  
![STUDENT - Cart](https://i.imgur.com/IZzXumu.png)  
![STUDENT - Stripe Checkout](https://i.imgur.com/cFrEXUN.png)  
![STUDENT - Order Success](https://i.imgur.com/SzrpOTj.png)  
![STUDENT - Bookings](https://i.imgur.com/03wAFH5.png)  

*All wireframes are in 'docs/wireframes' folder*
____
## Sitemap & Rails Routes:  
![Sitemap](https://i.imgur.com/e5GCsQK.png)  

![Routes](https://i.imgur.com/YuvJiuB.png)

*Images are in 'docs/sitemap' folder*
____
## Forking or Cloning this repo?
For this app to function with billing, an account with Stripe is required. You will need to add your Stripe API information to the credentials file in Rails. In the Stripe dashboard, create an appropriate webhook that points to your server.  

Select the event type: ```payment_intent.succeeded```

Your webhook URL should be:  
```https://yourdomain.com/students/make_booking```

If you are testing locally, use Ultrahook to forward http post data. 
```https://ultrahook.com/register```

The Ultrahook gem should already be installed from running 'bundle'.
From the command line in a separate tab or window, run: ```ultrahook stripe 3000```
(if you are using the default port)

Cloudinary is used to host images. You will need to create an account and add your credentials to rails.