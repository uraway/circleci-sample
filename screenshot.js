var instance = require('webpage').create();

instance.open('http://redpanthers.co', function () {
  instance.render('screenshot.png');
  console.log('screenshot.png was saved!')
  phantom.exit();
});
