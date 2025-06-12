<script setup lang="ts">
import {ref} from "vue";
import {useRouter} from "vue-router";
import {Notify} from 'quasar';

const API_URL = "http://localhost:3000/login";
const email = ref<string | null>(null);
const password = ref<string | null>(null);
const router = useRouter();
const loginUser = async () => {
  try {
    const res = await fetch(`${API_URL}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        email: email.value,
        password: password.value,
      })
    });

    console.log('Response Status:', res.status);
    const data = await res.json();

    // Assuming the server returns a status key to indicate success or failure
    if (res.ok && res.status == '200') {
      Notify.create({
        message: 'Login successful!',
        type: 'positive'
      });
      await router.push('/MainLayout');
      // You might want to redirect or perform other actions upon successful login
    } else {
      throw new Error('Login failed: ' + res.status);
    }
  } catch (error) {
    console.error('Error during login', error);
    Notify.create({
      message: 'Login failed. Please check your credentials and try again.',
      type: 'negative'
    });
  }
};

</script>

<template>
  <q-layout view="hHh lpR fFf">
    <q-page-container>
      <div class="div_background">
        <q-page class="bg-light-grey window-height window-width row justify-center items-center">

          <div class="column">
            <div class="row">
              <q-card bordered class="transparent-section">
                <div class="div_h5">
                  <h5 class="text-h5 q-my-md">Sign In</h5>
                </div>
                <q-card-section>

                  <q-form class="q-gutter-md">
                    <q-input filled v-model="email" label="Email" lazy-rules
                             :rules="[ val => val && !val.isEmpty || 'Please enter your email']"/>
                    <q-input filled v-model="password" label="Password" lazy-rules type="password" :rules="[ val => val && !val.isEmpty || 'Please enter your password']"/> </q-form>
                </q-card-section>
                <q-card-actions class="q-px-md">
                  <q-btn unelevated color="grey" size="lg" class="full-width" label="Login" @click="loginUser"/>
                </q-card-actions>
                <q-card-section class="text-center q-pa-none">
                  <p class="text-blue-grey-14">Not registered?<br>
                    <router-link to="/UserCreate">Create an Account!</router-link>
                    <br>
                    <router-link to=""> Can't Login?</router-link>
                  </p>

                </q-card-section>
              </q-card>
            </div>
          </div>
        </q-page>
      </div>
    </q-page-container>
  </q-layout>
</template>

<style scoped>
.div_background {
  background-image: url('/sportsHD.jpg');
  background-size: cover;
}
.transparent-section {
  background: rgba(128,128,128, 0.9);
  backgroud-filter: blur(6px);
  -webkit-backdrop-filter: blur(6px);
  border-radius: 20px;
}

.div_h5 {
  text-align: center;
  font-size: 2rem;
  font-weight: 600;
  color: rgb(0, 0, 0);
  margin-left: 10px;
}

.q-card {
  width: 360px;
}
</style>