var instance = require('webpage').create();

instance.open('http://localhost:3000', function () {
  instance.render('screenshot.png');
  console.log('screenshot.png was saved!')
  phantom.exit();
});
