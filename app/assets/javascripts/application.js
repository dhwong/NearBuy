/*
 ==== Standard ====
 = require jquery
 = require bootstrap

 ==== Angular ====
 = require angular

 ==== Angular Plugins ====
 = require lodash
 = require restangular
 = require angular-ui-router

 = require_self
 = require_tree ./angular/templates
 = require_tree .
 */

var APP = angular.module('Tutorial', [
  'ui.router',
  'templates',
  'restangular'
]);

APP.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', 'RestangularProvider',
    function($stateProvider, $urlRouterProvider, $locationProvider, RestangularProvider) {
  RestangularProvider.setBaseUrl('/api');
  RestangularProvider.setDefaultRequestParams({format: 'json'});

  $locationProvider.html5Mode(true);
  $urlRouterProvider.otherwise('/home');

  $stateProvider
    .state('landing', {
      url: '/',
      templateUrl: 'landing/landing.html',
    })
    .state('home', {
      url: '/home',
      abstract: true,
      templateUrl: 'home/index.html',
      controller: 'indexCtrl'
    })
    .state('home.suggestions', {
      url: '',
      templateUrl: 'home/suggestions.html',
    })
    .state('home.search', {
      url: '/results',
      templateUrl: 'home/results.html',
    })
    .state('widgets', {
      url: '/widgets',
      abstract: true,
      template: '<div ui-view></div>'
    })
    .state('widgets.list', {
      url: '',
      templateUrl: 'widgets/index.html',
      controller: 'WidgetsListController'
    })
    .state('widgets.show', {
      url: '/widgets/:id',
      templateUrl: 'widgets/show.html',
      controller: 'WidgetsShowController'
    });
}]);
