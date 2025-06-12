<template>

  <q-layout view="lHh lpR lFf">
    <q-header elevated class="bg-primary text-white" height-hint="98">
      <q-toolbar>
        <q-btn dense flat round icon="menu" @click="toggleLeftDrawer"/>
        <q-toolbar-title>
          <q-item clickable v-ripple @click="gotoDashboard">
            <q-avatar>
              <img src="https://cdn.quasar.dev/logo-v2/svg/logo-mono-white.svg" alt="Not available">
            </q-avatar>
            <p id="logoName">KimLibrary</p>
          </q-item>
        </q-toolbar-title>
        <q-btn flat round dense icon="more_vert"></q-btn>
      </q-toolbar>
    </q-header>

    <!--========== DRAWER ==========-->

    <q-drawer
        side="left"
        behavior="desktop"
        class="extraSpaceSideBarHeading sidebar-content"
        v-model="leftDrawerOpen"
        show-if-above
        :mini="miniState"
        @mouseover="miniState = false"
        @mouseout="miniState = true"
        :width="300"
        :breakpoint="500"
        bordered
        :class="$q.dark.isActive ? 'bg-grey-9' : 'bg-grey-3'">
      <!-- Recommendations -->
      <q-item
          clickable
          v-ripple
          active-class="my-menu-link">
        <q-item-section avatar>
          <q-icon name="thumb_up"/>
        </q-item-section>
        <q-item-section>
          <router-link to="/recommendations">Recomendaciones</router-link>
        </q-item-section>
      </q-item>
      <!-- Events -->
      <q-item
          clickable
          v-ripple
          active-class="my-menu-link">
        <q-item-section avatar>
          <q-icon name="calendar_today"/>
        </q-item-section>
        <q-item-section>
          <router-link to="/current-events">Eventos</router-link>
        </q-item-section>
      </q-item>
      <!-- Profile -->
<!--      <q-list padding>-->
<!--        <q-expansion-item-->
<!--            expand-separator-->
<!--            icon="manage_accounts"-->
<!--            label="Mi cuenta">-->
<!--        </q-expansion-item>-->
<!--      </q-list>-->
      <q-item
          clickable
          v-ripple
          active-class="my-menu-link">
        <q-item-section avatar>
          <q-icon name="settings_power"/>
        </q-item-section>
        <q-item-section>Logout</q-item-section>
      </q-item>
    </q-drawer>
    <q-page-container>
      <router-view/>
    </q-page-container>
  </q-layout>

</template>
<style>

@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap");

.extraSpaceOntop {
  padding-top: 100%;
}

.q-avatar {
  background-color: #f5f5f5;
  color: #000000;
}

#logoName {
  font-family: "Poppins", sans-serif;
  font-size: 1.5rem;
  font-weight: 600;
  color: rgb(0, 89, 105);
  margin-left: 10px;
}

.extraPaddingForSideBarFirstOption {
  padding-top: 60%;

}

</style>
<script lang="ts" setup>
import {ref, Ref, onMounted} from 'vue';
import {Router, useRoute, useRouter} from 'vue-router';

const leftDrawerOpen: Ref<boolean> = ref(false);
const miniState: Ref<boolean> = ref(true);
const router: Router = useRouter();


const gotoUserCreate = (): void => {
  router.push('/UserCreate');
};
const gotoUserList = (): void => {
  router.push('/UserList');
};
const gotoDashboard = (): void => {
  router.push('/');
};

const toggleLeftDrawer = (): void => {
  leftDrawerOpen.value = !leftDrawerOpen.value;
};
const stringOptions = [
  'Google', 'Facebook', 'Twitter', 'Apple', 'Oracle'
].reduce((acc: string[], opt: string) => {
  for (let i = 1; i <= 5; i++) {
    acc.push(opt + ' ' + i)
  }
  return acc
}, [])

const model = ref<string | null>(null)
const options = ref<string[]>(stringOptions)

const filterFn = (val: string, update: (callback: () => void) => void, abort: () => void): void => {
  update(() => {
    const needle = val.toLowerCase()
    options.value = stringOptions.filter(v => v.toLowerCase().includes(needle))
  })
}

const setModel = (val: string): void => {
  model.value = val
}
</script>
/style>