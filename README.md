Program 1: DireWolf Job Portal
==============================
**http://dry-citadel-4538.herokuapp.com/**<br/>

Online Deployment(User View)
---------------------------

The website is deployed at http://dry-citadel-4538.herokuapp.com/ <br/>
Since we use google account to authenticate we have created some default google accounts for your convenience. The accounts are given below:

* **Admin account:** <br/>
*Username:* `direwolfapp.user1`<br/>
*Password:*  `appAdmin`
* **Employer account:**  <br/>
*Username:* `direwolfapp.user2`<br/>
*Password:*  `appEmploy`
* **Job Seeker account:**  <br/>
*Username:* `direwolfapp.user3`<br/>
*Password:*  `appJobSeeker`


While the functionality exists for you to change the password, please do not so other users will be able to use these accounts. These users are added to prevent people from having to use their personal google credentials. As an aside, we are using Google authentication to simplify authentication. tl;dr we do nothing with your data.

**If you decide to register a new user please refer the following:**<br/>
- Select "Sign in with Google" and select your google account (or enter your credentials)
- Select the user you would like to log in as.
- Fill out the form provided.
- Submit the form. If you are logging in as a seeker that is it.
- If you register as an admin or employer you will need to authenticate yourself via an existing admin user the username and password provided.

**Update**
- *9/28 5:20PM*: Reviewers were having problem switching between accounts. This was caused as they remain logged in the google accounts even after logging out of the website. I wish to point out that this is the general practice followed by all standard websites around the internet using google login. We recieved a lot of feedback on this issue so to help out the reviewers we decided to change this. Hence now we log you out of the google account as well. We aplologise for the inconvenience caused.
- *2/10 1:40AM*: Mailers added.
- *8/10 9:49PM*: More test cases added.<br/>

Standbox Installation(Developer View)
-------------------------------------------

Steps to start the app on Linux, Mac and Windows

1. Enter the application directory:
```bash
$> cd /home/blah/blah/direwolf/
```
2. Install required gems
```bash
$> bundle install
```
3. Set up database
```bash
$> rake db:migrate
```
4. Compile assets
```bash
$> rake assets:precompile
```
5. Run the app wit WEBricks server
```bash
$> rackup config.ru
```
6. Open a web-browser and enter the url <br/>
   `http://localhost:9292`

Extra features
--------------
Mailers 

Plan to implement
-----------------
