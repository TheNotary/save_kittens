## 0.1.x

STUFF I SHOULDN'T SPEND TIME ON:
  - Setup env for production (nginx + thin + mongrels?)
  - Optimize the SQL query so it's cached?



## 0.0.x


STUFF OF UNKNOWN IMPORTANCE:

  - Add some functional tests
    * Research proper javascript testing methods
  - Use javascript html templating
    - Research and email



STUFF OF VERY HIGH IMPORTANCE:

  - Just using a pre-existing theme indicates you can't roll your own stuff
    - Handle the thank_you as a modal
    - Signing should be an ajax function
      > but do it in a manor that can't be attacked with xs stuff


Currently:

  - replace polling with websocket notification pushing
    > Lol, running the tests allows faye to comunicate with the dev/production
      html clients...

  - double check that chart thing, it may be misconfigured


Finished:
  - BugFix: Faye was getting odd when deleting subscriptions, subs are now permanent
  - Got faye working with ssl
  - Added deflator middleware to get a cleaner chrome audit
  - Completed cool graph indicating when signers showed up
    https://github.com/loule/js-chart-widgets/
  - Added really good selenium driver tests to capture all possible states of pluralization and admin login
  - BUG: when going from thank_you to / the javascript wasn't re-initializing...
  - implement page-specific javascript
  - Started admin page
  - Add the #admins_only before filter
  - validate email presence
  - validate name presence
  - Validate uniqueness of email, change thankyou to "You already signed successfully."
  - Validations: email, zipcode
  - Update social media cards
  - Update payload on social media icons
  - BUG:  pluralization of "the top 2 most committed state is"
  - BUG: emergency fixed the thank_you to render a tiny bit nicer, though should become a modal I think...
  - Signature Form: name, email, subscribe to our list, and zip code, state
  - Stats for page counter:  Show top 3 states contributing signatures
  - refresh stats every 2 seconds
  - Landing page HTML
  - Stick a theme to it
