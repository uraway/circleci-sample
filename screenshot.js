var page = require('webpage').create();

page.open('https://circleci.com/‎', function() {
  page.render('screenshot.png');
  console.log('screenshot saved!');
  phantom.exit();
});
