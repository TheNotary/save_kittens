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

  - Show off by using websockets instead of polling =D

  - Implement admin interface at /signatures !
    > Pop in devise for logins!!!  
    > Make a heat map that indicates activity across the states/ cities?
    > Show statistics like "lumps of registrations" on a timeline
    > Make certain things are fancy and show off my CSS skills properly

  - Learn node.js or express node, and replace 2 second polling with websocket
    connections

Currently:

  - Add really good request specs to capture all possible states of the
    javascript tempate since you missed that bug

  - Add tests that admin can log in....

  - create the /admin page
    > HEAT map
    http://www.patrick-wied.at/static/heatmapjs/

    > See a cool timeline of when people signed
    https://github.com/loule/js-chart-widgets/

  - There's a bug in the pluralization code still
    > with two signatures from cali...
      The top 1 most committed states are... state is...
        >>>> Oh, it's related to the gon changes I'm in the middle of... need to wait
        for window to be ready before... invoking a functino that utilized a gon variable....



Finished:
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
