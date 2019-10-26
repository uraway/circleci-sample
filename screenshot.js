var page = require('webpage').create();

page.open('https://circleci.com/‎', function (status) {
    console.log(status);
    page.render('./screenshot.png');
    console.log('screenshot saved!');
    phantom.exit();
});
