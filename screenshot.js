var instance = require('webpage').create();

instance.open('http://redpanthers.co', function () {
  instance.render('screenshot-phantom.png');
  phantom.exit();
});
