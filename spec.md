# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - used Sinatra (required gem and used routes etc.)
- [x] Use ActiveRecord for storing information in a database - also used ActiveRecord
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) Models are Users and GearItems.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - A User has many GearItems
- [x] Include user accounts - Users log in to a session
- [x] Ensure that users can't modify content created by other users - There is a check when patching to /gear to ensure the current session id matches the gear_item's user id.
- [x] Include user input validations - Make sure users don't register with blank username or password.  Also check that a gear_item's name doesn't get changed to blank ("") on update.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - used rack-flash3 to display flash messages throughout.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - yes.

Confirm
- [x] You have a large number of small Git commits - yes.
- [x] Your commit messages are meaningful - hopefully, yes.
- [x] You made the changes in a commit that relate to the commit message - yes.
- [x] You don't include changes in a commit that aren't related to the commit message - yes.
