# TutorMe 

### Requirements:  
* Ruby v 3.0.0
* Rails v 6.1.3
* PostgreSQL

### Tech Stack:  
* HTML
* CSS / SCSS
* PostgreSQL
* Javascript
* Ruby
* Rails

____
## Live app:  
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

All snapshots of Trello board in 'docs/trello_snapshots' folder
___
## User Stories
### The following user stories are implemented in the code 
![User Stories #2](https://i.imgur.com/pUvYukN.png)
![User Stories #1](https://i.imgur.com/PwEN3eQ.png)


All images are in 'docs/user_stories' folder
___
## Testing

console tests:
harold = Tutor.first
	harold.id # 1
joe = Student.first
	joe.id # 1
subject = harold.subjects.find(5)
	subject.id # 5
	subject.title # "diving"
	subject.time # 52

1. Create a record in *Bookings* model based on the above data:
booking_2 = joe.bookings.create(tutor_id: harold.id, time: 1,subject_id: subject.id)
test:  

booking_2.tutor.firstname `# "Harold"`

booking_2.student.firstname `# "Joe"`

booking_2.subject.title `# "diving"`

booking_2.subject.time `# 52`

booking_2.time `# 1`

booking_2.id `# 1`


joe.bookings  
` [#<Booking id: 1, time: 1, tutor_id: 1, student_id: 1, subject_id: 5, created_at: "2021-03-13 02:06:56.329396000 +0000", updated_at: "2021-03-13 02:06:56.329396000 +0000">, #<Booking id: nil, time: 1, tutor_id: 1, student_id: 1, subject_id: 5, created_at: nil, updated_at: nil>]`

harold.bookings  
`
[#<Booking id: 1, time: 1, tutor_id: 1, student_id: 1, subject_id: 5, created_at: "2021-03-13 02:06:56.329396000 +0000", updated_at: "2021-03-13 02:06:56.329396000 +0000">]
`

## *All console tests passed.*  

2. Create a record in *Payments* based on the Booking data:

payment_2 = Payment.create(amount: 40, booking_id: booking_2.id)

payment_2.amount `# 40`


The Bookings and Payments models are set up and working as expected, tested via the Rails console.

![Testing #1](https://i.imgur.com/fFaeUCi.png)  
![Testing #2](https://i.imgur.com/2oDtNIP.png)  
![Testing #3](https://i.imgur.com/AEuE76P.png)  
![Testing #4](https://i.imgur.com/4vVZHUJ.png)  

All testing screenshots are in 'docs/testing' folder
____
## Entity Relationship Diagram (ERD):  
![https://i.imgur.com/LNgGpUJ.png](https://i.imgur.com/LNgGpUJ.png)

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

All wireframes are in 'docs/wireframes' folder
____
## Sitemap & Rails Routes:  
![Sitemap](https://i.imgur.com/e5GCsQK.png)  

![Routes](https://i.imgur.com/YuvJiuB.png)

Images are in 'docs/sitemap' folder
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