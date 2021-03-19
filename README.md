# TutorMe 

Requirements:  
* Ruby v 3.0.0
* Rails v 6.1.3
* PostgreSQL

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
This app is a two-sided marketplace matching students with tutors. 

Tutors can create a profile and list subjects they teach, and receive payment for their time.

Students can search for tutors teaching subjects of interest, and book tutoring time.

Payments are made via Stripe API integration.

## Why TutorMe? 
A service that brings together teaching talent and those who have a need for one-on-one training is always valuable. Students at university, community college, self-studying or doing bootcamps all can benefit from finding the perfect tutor who can help their learning journey.

This app is simple to use and with a very short time commitment, a student and tutor can be in touch and having an online Zoom meeting, or Skype call. Once a successful payment and booking has been made, both parties are given their other's contact information.

## Current Functionality
This version is a Minimum Viable Product (MVP). There are many features yet to be added to build this out into a fully functional marketplace. As of right now, Tutors can create subjects and set the number of hours they can dedicate to tutoring for each subject. All bookings are tracked and logged in the bookings page with total earned.

Students can search for tutors based on subject, subject hours available, state, country, firstname and lastname. They can favourite tutors to create a shortlist for easy recall within their account, and can book tutors 1 hour at a time. Again, student can see all their billing history.

## Limitations
Payment to tutors bank account is not currently available in this version of the app. However this can be done outside of the system using Stripe reports and invoices.

Hours booked is currently hard coded to 1 hour blocks.

One hour is currently billed at $60 AUD.

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