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

var LocationsNewPage = {
  template: "#locations-new-page",
  data: function() {
    return {
      name: "",
      address: "",
      hours: "",
      phone_number: "",
      website: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name,
        input_address: this.address,
        input_hours: this.hours,
        input_phone_number: this.phone_number,
        input_website: this.website
      };
      axios
        .post("/v1/locations", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ReviewsNewPage = {
  template: "#reviews-new-page",
  data: function() {
    return {
      title: "",
      body: "",
      user_id: "",
      location_id: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_title: this.title,
        input_body: this.body,
        input_user_id: this.user_id,
        input_location_id: this.location_id
      };
      axios
        .post("/v1/reviews", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage },
    { path: "/locations", component: LocationsPage},
    { path: "/locations/new", component: LocationsNewPage},
    { path: "/reviews/new", component: ReviewsNewPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});