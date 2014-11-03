'use strict'

###*
 # @ngdoc overview
 # @name crnNotifierApp
 # @description
 # # crnNotifierApp
 #
 # Main module of the application.
###
angular
  .module('crnNotifierApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'cgBusy',
    'config'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/subscribe.html'
        controller: 'SubscribeCtrl'
  .config ($httpProvider) ->
    # Intercept POST requests, convert to standard form encoding
    $httpProvider.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    $httpProvider.defaults.transformRequest.unshift (data) ->
      return if not data
      key = result = []
      for own key, value of data
        if data.hasOwnProperty key
          result.push(encodeURIComponent(key) + "=" + encodeURIComponent(value))
      result.join "&"
