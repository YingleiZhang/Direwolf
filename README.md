DireWolf-Job-Portal-sportsball1
Program 1: DireWolf Job Portal Standbox Installation(Develoer View)
=====================================
How to start the app

Linux(Possibly Mac also)

1. Enter the application directory
   $> cd /home/blah/blah/direwolf/

2. Run the app wit WEBricks server
   $> rackup config.ru
   **** Server is up Yay!!! ****

3. Open webbrowser and enter
   localhost:9292
   **** Its Alive!!! ****

Program 1: DireWolf Job Portal Online Deployment(User VIew)
====================================== 

The website is deployed at http://dry-citadel-4538.herokuapp.com/
Users are:

1. direwolfapp.user1:appAdmin
2. direwolfapp.user2:appEmploy
3. direwolfapp.user3:appJobSeeker

While the functionality exists for you to change the password, please do not so other users will be able to use these accounts. These users are added to prevent people from having to use their personal google credentials. As an aside, we are using Google authentication to simplify authentication. tl;dr we do nothing with your data.

We decided to use google authentication for this project.

1. Select "Sign in with Google" and select your google account (or enter your credentials)
2. Select the user you would like to log in as.
3. Fill out the form provided.
4. Submit the form. If you are logging in as a seeker that is it. If you are logging in as an employer or admin you will need to be approved by an admin.
5. If you register as an employer of admin you will need to authenticate yourself via master admin user the username and password provided.
# Extra features

There are no extra features currently implemented. 

# Plan to implement

Plan to implement mailures and additional tests.
