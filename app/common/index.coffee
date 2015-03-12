angular.module('common', [
  # Declare here all AngularJS dependencies that are shared by all modules.
  'supersonic', 'firebase', 'angularMoment'
])
.constant 'angularMomentConfig',
  timezone: 'Europe/London'
