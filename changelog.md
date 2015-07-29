## 0.1.x
  - Email:
    * Do I get extra points for setting up nginx/ thin on the test machine?
    * Am I typically going to be building front end stuff rapidly?
    * Should I handle mailings too?
    * Is there a javascript html templating solution used internally at the moment?

## 0.0.x

  - Show off by using Faye instead of polling =D
  - Setup env for production (nginx + thin + mongrels?)
  - Handle the thank_you as a modal
  - Validate uniqueness of email, change thankyou to "You already signed successfully."
  - Add some functional tests
    * Research proper javascript testing methods
  - Use javascript html templating
    - Research and email
  - Signing should be an ajax function


Currently:

  - Validations: email, zipcode


Finished:

  - Update social media cards
  - Update payload on social media icons
  - BUG:  pluralization of "the top 2 most committed state is"
  - BUG: emergency fixed the thank_you to render a tiny bit nicer, though should become a modal I think...
  - Hide the /signatures link since wasn't requested
  - Signature Form: name, email, subscribe to our list, and zip code, state
  - Stats for page counter:  Show top 3 states contributing signatures
  - refresh stats every 2 seconds
  - Landing page HTML
  - Stick a theme to it
