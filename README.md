# Lupo Bianco Custom Tailoring Database

Lupo Bianco Custom Tailoring is a company in Strathfield, Sydney that sells custom-made suits to customers based on their measurements. They offer various customisation options to enable a bespoke experience. 

This is a project programmed in RUBY 2.7.0 on RAILS 5.2.6.
It is designed to allow a customer to freely order custom made suits online based on user-inputted measurements, see past order history and finally checkout using Stripe.

[Check out the site here](https://protected-cove-45699.herokuapp.com/) (Due to a bug in database seeding, Heroku cannot display the site. This will be fixed.)

## The Database

[Model Wirefirame](https://i.imgur.com/f5QI3Qq.png)

The Database is comprised of 4 models - User, Profile, Suit, Cart. The User contains login information, and other details such as mobile number and address to facilitate easy ordering. It has many profiles, one cart, and many suits through profiles.

Profile contains details such as name, gender, and body measurements. These columns are also accessed by the suits model to prevent unnessecessary duplication of data. Note that these columns are not present in User - this is to allow any one User to store many different people's details, enabling the creation and ordering of suits for multiple people with a single account. This is a decision justified by the fact that many customers like to order multiple suits for multiple people. As such, a profile has many suits, and belongs to user.

Suit contains the rest of the details nessecary for orders - namely the various customisation options such has style, fit, lapel type, color, etc., and price. It also contains the column 'paid' which stores a boolean. This determines whether or not the suit can be edited, deleted or purchased by the user. Every suit is added to Cart upon creation, and removed when paid for.
Suit belongs to the Profile model, and Cart when paid is true.

Both the profile and suit are inspired by [this template](https://docs.google.com/spreadsheets/d/1_aXoHIvmWSW_jQuTlRXTHwPIlOuJWnJG/edit?usp=sharing&ouid=116359590426673688212&rtpof=true&sd=true) the real company uses for their customers (personal details are ommitted).

Cart only contains user_id has a column. Its purpose is merely to facilitate the purchase of suits, enabled through stripe API.

## Other wireframes
[Site Layout](https://i.imgur.com/BiWymSN.png)
[How the cart works](https://i.imgur.com/BiWymSN.png)


## BUGS
- Due to a bug in database seeding, Heroku cannot display the site. This will be fixed.

## Other

At the moment, the site functions more as a proof of concept, rather than a useable tool. I'd like to add more features, such as:
- Proper CSS styling
- Admin Users and Staff Users
    - This will allow the site to provide more functionality for staff during appointments.
- Export invoice, suit details to .pdf and email
    - This will allow staff to easily send suit details to tailors with little trouble.

