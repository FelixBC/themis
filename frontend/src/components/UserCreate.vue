<script lang="ts" setup>
import { ref, computed } from 'vue';
import { User } from "./types.ts";
import { Notify } from 'quasar';

const name = ref<string | null>(null);
const password = ref<string | null>(null);
const isPwd = ref<boolean>(true);
const confirmPassword = ref<string | null>(null);
const email = ref<string | null>(null);
const API_URL = "http://localhost:3000/users";
const users = ref<User[]>([]);

const passwordsMatch = computed(() => password.value === confirmPassword.value);

const createUser = async () => {
  try {
    if (!passwordsMatch.value) {
      throw new Error('Passwords do not match');
    }

    const res = await fetch(API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        email: email.value,
        password: password.value,
      })
    });

    if (!res.ok) {
      throw new Error('Registration failed');

    }

    const data = await res.json();
    users.value.push(data);
    Notify.create({
      message: 'Registration successful!',
      type: 'positive'
    });
    onReset();
  } catch (error) {
    console.error('Error during registration', error);
    Notify.create({
      message: 'Registration failed. Please try again.',
      type: 'negative'
    });
  }
};

const onReset = () => {
  password.value = null;
  confirmPassword.value = null;
  email.value = null;
};
</script>
<template>
  <q-layout>
    <q-page-container>
      <div class="div_background">
        <q-page class="bg-light-grey window-height window-width row justify-center items-center">
          <q-form>
            <q-card class="full-width" style="max-width: 800px;">
              <q-card-section>
                <div class="icon_arrowback">
                  <router-link to="/">
                    <q-icon class="icon_arrowback" name="arrow_back"></q-icon>
                  </router-link>
                </div>
              </q-card-section>
              <q-card-section
                  style="font-size: 1.3em;"
                  class="text-center">

                <q-card-section>
                  <h4> Crear Cuenta </h4>
                </q-card-section>

                <div class="form-columns">
                  <div class="form-column">
                    <q-card-section>
                      <q-input
                          filled
                          v-model="email"
                          label="User "
                          hint="JhonDoe@gmail.com"
                          lazy-rules
                          :rules="[ val => val && !val.isEmpty || 'Debe escribir un email']"
                      />
                    </q-card-section>
                  </div>
                  <div class="form-column">
                    <q-card-section>
                      <q-input v-model="password" filled :type="isPwd ? 'password' : 'text'"
                               label="Password"
                               hint="Password">
                        <template v-slot:append>
                          <q-icon
                              :name="isPwd ? 'visibility_off' : 'visibility'"
                              class="cursor-pointer"
                              @click="isPwd = !isPwd"
                          />
                        </template>
                      </q-input>

                    </q-card-section>
                  </div>
                  <div class="form-column">
                    <q-card-section>
                      <q-input
                          filled
                          type="password"
                          v-model="confirmPassword"
                          hint="Confirm Password"
                          label="Confirm Password "
                          lazy-rules
                          :rules="[val => val && passwordsMatch || 'Passwords do not match']"
                      />
                    </q-card-section>
                    <q-card-section>
                      <div class="form-column">
                      </div>
                      <div class="divButtons">
                        <q-btn color="primary" @click="createUser">Create</q-btn>
                        <q-btn label="Reset" type="reset" color="primary" flat class="q-ml-sm"/>
                      </div>
                    </q-card-section>
                  </div>
                </div>
              </q-card-section>
            </q-card>
          </q-form>
        </q-page>
      </div>
    </q-page-container>
  </q-layout>
</template>
<style scoped>
.div_background {
  background-image: url('public/LibraryHD.jpg');
  background-size: cover;
}


.icon_arrowback {
  text-align: left;
  font-size: 1.3rem;
}

.q-card {
  width: 360px;
}
</style>