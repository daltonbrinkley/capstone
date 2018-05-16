/* global Vue, VueRouter, axios, google, polyfill */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      reviews: []
    };
  },
  created: function() {
    axios.get("v1/reviews").then(function(response) { 
      this.reviews = response.data;
      console.log(this.reviews);
    }.bind(this)
    );
  },
  mounted: function() {
    polyfill();
  },
  methods: {},
  computed: {
    topReviews: function() {
      return this.reviews.slice(0, 3);
    }
  }
};

var LocationsPage = {
  template: "#locations-page",
  data: function() {
    return {
      message: "Welcome to the Locations Page!",
      locations: [],
      nameFilter: "",
    };
  },
  created: function() {
    axios.get("v1/locations").then(function(response) { 
      this.locations = response.data;
      Vue.nextTick(function() {
        console.log('update height...');
        // console.log(this.$el.clientHeight);
        // containerGridMasonry();
        // initTheme();
        // int_nav_menu_height();
      });
      console.log(this.locations);
    }.bind(this)
    );
    if (this.$route.query.name) {
      this.nameFilter = this.$route.query.name;
    }
  },
  methods: {
    setCurrentLocation: function(inputLocation) {
      this.currentLocation = inputLocation;
    },
    isValidLocation: function(inputLocation) {
      var lowerInputName = inputLocation.name.toLowerCase();
      var lowerNameFilter = this.nameFilter.toLowerCase();
      return lowerInputName.includes(lowerNameFilter);
    },
  },
  computed: {},
};

var LocationsNewPage = {
  template: "#locations-new-page",
  mounted() {
    this.autocomplete = new google.maps.places.Autocomplete(
      (this.$refs.autocomplete),
      {types: ['establishment']}
    );
    this.autocomplete.addListener('place_changed', () => {
      let place = this.autocomplete.getPlace();
      let ac = place.address_components;
      let lat = place.geometry.location.lat();
      let lon = place.geometry.location.lng();
      let city = ac[0]["short_name"];

      console.log(`The user picked ${city} with the coordinates ${lat}, ${lon}`);

      var address = '';
      if (place.address_components) {
        address = place.formatted_address;
        console.log('the address is ', address);
        this.address = address;
      }

      var phoneNumber = '';
      if (place.address_components) {
        phoneNumber = place.formatted_phone_number;
        console.log('the phone number is', phoneNumber);
        this.phone_number = phoneNumber;
      }

      // var hours = '';
      // if (place.address_components) {
      //   hours = place.opening_hours.periods[2].open;
      //   console.log('the hours are', hours);
      //   this.hours = hours;
      // }

      var website = '';
      if (place.address_components) {
        website = place.website;
        console.log('the website is', website);
        this.website = website;
      }
    });
  },
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

          console.log(response.data.user);
          this.$root.userName = response.data.user.first_name;

          localStorage.setItem("jwt", response.data.jwt);
          localStorage.setItem("first_name", response.data.user.first_name);
          router.push("/");
        }.bind(this))
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
    localStorage.removeItem("first_name");
    router.push("/");
  }
};

var LocationsShowPage = {
  template: "#location-show-page",
  data: function() {
    return {
      location: [],
      title: "",
      body: "",
      user_id: "",
      location_id: "",
      errors: [],
      map: null
      // location: {
      //   name: "Location name goes here",
      //   address: "Location address goes here",
      //   hours: "Location hours go here",
      //   phone_number: "Phone Number goes here",
      //   website: "Website goes here"
      // }
    };
  },
  created: function() {
    console.log("what is this weird $route thing", this.$route);
    axios.get("v1/locations/" + this.$route.params.id).then(
      function(response) {
        this.location = response.data;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': this.location.address}, function(results, status) {
          if (status === 'OK') {
            this.map.setCenter(results[0].geometry.location);

            var marker = new google.maps.Marker({
              map: this.map,
              position: results[0].geometry.location
            });

            var infowindow = new google.maps.InfoWindow();
            var i;
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
              return function() {
                infowindow.setContent(
                  '<h6>' + this.location.name + '</h6>' + 
                  '<h8>' + this.location.address + '</h8>'
                  // '<img src="' + this.location.image + '" width=150>'
                );
                infowindow.open(this.map, marker);
              }.bind(this);
            }.bind(this))(marker, i)
            );
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        }.bind(this));

        console.log('LOCATION', this.location);
      }.bind(this)
    );
  },
  mounted: function() {
    this.map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      center: new google.maps.LatLng(41.892090, -87.634995),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
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
  },
  computed: {}
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage },
    { path: "/locations", component: LocationsPage},
    { path: "/locations/new", component: LocationsNewPage},
    { path: "/reviews/new", component: ReviewsNewPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/locations/:id", component: LocationsShowPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  data: function() {
    return {
      userName: "",
      nameFilter: "",
      email: "",
      password: "",
      errors: []
    };
  },
  created: function() {
    var jwt = localStorage.getItem("jwt");
    this.userName = localStorage.getItem("first_name");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  },
  methods: {
    searchLocationsByName: function() {
      console.log("searching...", this.nameFilter);
      router.push("/locations?name=" + this.nameFilter);
    },
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;

          console.log('user info', response.data.user);
          this.$root.userName = response.data.user.first_name;

          localStorage.setItem("jwt", response.data.jwt);
          localStorage.setItem("first_name", response.data.user.first_name);
          router.push("/locations");
        }.bind(this))
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  },
  watch: {
    '$route': function() {
      window.location.reload();
    }
  }
});