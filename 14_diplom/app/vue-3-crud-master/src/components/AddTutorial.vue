<template>
  <div class="submit-form">
    <div v-if="!submitted">
      <div class="form-group">
        <label for="family">family</label>
        <input
          type="text"
          class="form-control"
          id="fanily"
          required
          v-model="tutorial.family"
          name="family"
        />
      </div>

      <div class="form-group">
        <label for="name">name</label>
        <input
          class="form-control"
          id="name"
          required
          v-model="tutorial.name"
          name="name"
        />
      </div>

      <div class="form-group">
        <label for="mobile">mobile</label>
        <input
          class="form-control"
          id="mobile"
          required
          v-model="tutorial.mobile"
          name="mobile"
        />
      </div>

      <div class="form-group">
        <label for="email">email</label>
        <input
          class="form-control"
          id="email"
          required
          v-model="tutorial.email"
          name="email"
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
        title: "",
        description: "",
        published: false
      },
      submitted: false
    };
  },
  methods: {
    saveTutorial() {
      var data = {
        title: this.tutorial.title,
        description: this.tutorial.description
      };

      TutorialDataService.create(data)
        .then(response => {
          this.tutorial.id = response.data.id;
          console.log(response.data);
          this.submitted = true;
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

