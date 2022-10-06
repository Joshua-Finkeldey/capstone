<template>

<div id= "loginContainer">
      
        <div id="EmployeeLogoContainer">
          <router-link :to="'/'">
            <img id ="EmployeeBigLogo" src="../assets/UziVert.png">      
            </router-link>
        </div>

        <div id="BestPlace">
            <img id="BestPlaceAward" src="../assets/BestPlaceToWork.png">
            </div>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal SignIn">Employee Login</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link :to="{ name: 'register' }">Need an account?    </router-link>
      <button type="submit">Sign in</button>
    </form>
  </div>
  </div>
  
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    // login() {
    //   authService
    //     .login(this.user)
    //     .then(response => {
    //       if (response.status == 200) {
    //         this.$store.commit("SET_AUTH_TOKEN", response.data.token);
    //         this.$store.commit("SET_USER", response.data.user);
    //         this.$router.push("/");
    //       }
    //     })
    //     .catch(error => {
    //       const response = error.response;

    //       if (response.status === 401) {
    //         this.invalidCredentials = true;
    //       }
    //     });
    // }
    
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("employee-home");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>
<style scoped>
#loginContainer {
  background-color: #B7D8BD;
  padding-top: 4em;
  text-align: -webkit-center;
  object-fit: cover;
  vertical-align: top;
  overflow: hidden;
  width: 100%;
  height: 1000px; 
}
#EmployeeBigLogo {
  width: 500px
}
#BestPlaceAward {
width: 175px;
}
#login {
  width: 20%;
}
</style>