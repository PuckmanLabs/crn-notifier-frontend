'use strict'

###*
 # @ngdoc function
 # @name crnNotifierApp.controller:SubscribeCtrl
 # @description
 # # SubscribeCtrl
 # Controller of the crnNotifierApp
###
angular.module('crnNotifierApp')
  .controller 'SubscribeCtrl', ($scope, $http, ENV) ->
    $scope.subscribe = (subscriber) ->
      $scope.error = null

      if !subscriber.phone and !subscriber.email
        return showError "A phone number or email must be provided", "error"

      $scope.subscribePromise = $http.post(ENV.apiBase + '/register/', subscriber)
      $scope.subscribePromise.success (data, status, headers, config) ->
        showError "We'll keep a watch on that for you!", "success"
        $scope.subscriber.crn = null
      $scope.subscribePromise.error (data, status, headers, config) ->
        showError "Something went wrong...", "error"

    showError = (message, type="", title="") ->
      if type == ""
        type = "error"

      if title == ""
        title = switch type
          when "error" then "Ruh-roh!"
          when "success" then "Yay!"
          else ""

      $scope.error =
        type: type
        title: title
        message: message
