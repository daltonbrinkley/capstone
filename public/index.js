/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var LocationsPage = {
  template: "#locations-page",
  data: function() {
    return {
      message: "Welcome to the Locations Page!",
      locations: []
    };
  },
  created: function() {
    axios.get("v1/locations").then(function(response) { 
      this.locations = response.data;
      console.log(this.locations);
    }.bind(this)
    );
  },
  methods: {},
  computed: {},
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage },
    { path: "/locations", component: LocationsPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});