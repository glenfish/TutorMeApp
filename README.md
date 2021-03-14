# TutorMe 

This repository contains Nicholas Fehlberg's T2A2 Marketplace Assignment for CoderAcademy
Date: 14 March 2021
* Ruby v3.0.0
* Rails v6.1.3
* Database: PostgreSQL
* Bundler required for Gems
* Merchant services provided by Stripe

____
### Install:  
```git clone https://github.com/glenfish/testapp2.git```

Run: ```bundle install```

Create Database: ```rails db:create```

Migrate: ```rails db:migrate```

Runs on localhost:3000

____

#### What is TutorMe?  
This app is a two-sided marketplace matching students with tutors. 

Tutors can create a profile and list subjects they teach, and receive payment for their time.

Students can search for tutors teaching subjects of interest, and book tutoring time.

Payments are made via Stripe API integration.

#### Why TutorMe? 
A service that brings together teaching talent and those who have a need for one-on-one training is always valuable. Students at university, community college, self-studying or doing bootcamps all can benefit from finding the perfect tutor who can help their learning journey.

This app is simple to use and with a very short time commitment, a student and tutor can be in touch and having an online zoom meeting, or Skype call. Once a successful payment and booking has been made, both parties are given their other's contact information.

#### Current Functionality
This version is a Minimum Viable Product (MVP). There are many features yet to be added to build this out into a fully functional marketplace. As of right now, Tutors can create subjects and set the number of hours they can didicate to tutoring for that subject. All bookings are tracked and logged in the bookings page with total earned.

Students can search for tutors based on subject, subject hours available, state, country, firstname and lastname. They can favourite tutors to create a shortlist for easy recall within their account, and can book tutors 1 hour at a time. Again, student can see all their billing history.

#### Forking or Cloning this repo?
For this app to function with billing, you will need to create a free account with Stripe and get your API keys. You will need to set them up in your credentials file. You will also need to create an appropriate webhook  on your Stripe dashboard that points to your server.  

Ensure you select the event type: *payment_intent.succeeded*
Your webhook URL should be:
```https://yourdomain.com/students/make_booking```

If you are testing locally, use Ultrahook to forward http post data. 
```https://ultrahook.com/register```
The Ultrahook gem should already be installed from running 'bundle'.
From the command line in a separate tab or window, run:
```ultrahook stripe 3000```
(if you are using the default port)

All contributions to this repo are welcome.