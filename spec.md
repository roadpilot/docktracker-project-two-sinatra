# Specifications for the Sinatra Assessment

Specs:
- [X] Use Sinatra to build the app
- [X] Use ActiveRecord for storing information in a database
      Both accomplished with the Corneal gem
- [X] Include more than one model class (e.g. User, Post, Category)
      User, Location, and Comment classes
- [X Include at least one has_many relationship on your User model (e.g. User has_many Posts)
      User has many locations and comments, Location has many comments
- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
      Comments belong to user and location
- [X] Include user accounts with unique login attribute (username or email)
      User validates :email, :handle, uniqueness
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [X] Ensure that users can't modify content created by other users
      UD methods require current user validation
- [X] Include user input validations
      All user input field validate for presence
- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
      Impliment sinatra-flash error messages
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
      See the README.md file

Confirm
- [X] You have a large number of small Git commits
      39 to this point
- [X] Your commit messages are meaningful
      To the best of my ability
- [X] You made the changes in a commit that relate to the commit message
      Definitely better as time went on
- [X] You don't include changes in a commit that aren't related to the commit message
      Definitely better as time went on
