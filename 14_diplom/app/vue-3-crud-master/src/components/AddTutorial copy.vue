<template>
  <div class="submit-form">
    <div v-if="!submitted">
      <div class="form-group">
        <label for="family">Family</label>
        <input
          type="text"
          class="form-control"
          id="family"
          required
          v-model="tutorial.family"
          name="family"
        />
      </div>

      <div class="form-group">
        <label for="name">Name</label>
        <input
          class="form-control"
          id="name"
          required
          v-model="tutorial.name"
          name="name"
        />
      </div>

       <div class="form-group">
        <label for="Mobile">Mobile</label>
        <input
          class="form-control"
          id="mobile"
          required
          v-model="tutorial.mobile"
          name="mobile"
        />
      </div>

       <div class="form-group">
        <label for="Email">Email</label>
        <input
          class="form-control"
          id="email"
          required
          v-model="tutorial.email"
          name="email"
        />
      </div>

      <div class="form-group">
        <label for="id_us">id_us</label>
        <input
          class="form-control"
          id="id_us"
          required
          v-model="tutorial.id_us"
          name="id_us"
        />
      </div>

      <button @click="saveTutorial" class="btn btn-success">Submit</button>
    </div>

    <div v-else>
      <h4>You submitted successfully!</h4>
      <button class="btn btn-success" @click="newTutorial">Add</button>
    </div>
  </div>
</template>

<script>
import TutorialDataService from "../services/TutorialDataService";

export default {
  name: "add-tutorial",
  data() {
    return {
      tutorial: {
        id: null,
        family: "",
        name: "",
        mobile: "",
        email: "",
        id_us: ""
      },
    };
  },
  methods: {
    saveTutorial() {
      var data = {
        family: this.tutorial.family,
        name: this.tutorial.name,
        mobile: this.tutorial.mobile,
        email: this.tutorial.email,
        id_us: this.tutorial.id_us
      };

      TutorialDataService.create(data)
        .then(response => {
          this.tutorial.id = response.data.id;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },
    
    newTutorial() {
      this.submitted = false;
      this.tutorial = {};
    }
  }
};
</script>

<style>
.submit-form {
  max-width: 300px;
  margin: auto;
}
</style>
