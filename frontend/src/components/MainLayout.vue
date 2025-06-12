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
        :width="200"
        :breakpoint="500"
        bordered
        :class="$q.dark.isActive ? 'bg-grey-9' : 'bg-grey-3'">

      <!-- Users -->
      <q-list padding class="extraPaddingForSideBarFirstOption">
        <q-expansion-item
            expand-separator
            icon="perm_identity"
            label="Usuarios">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/users">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/users/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Employees -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="perm_identity"
            label="Empleados">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/employees">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/employees/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Provinces -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="location_city"
            label="Provincias">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/provinces">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/provinces/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Cities -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="location_city"
            label="Ciudades">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/cities">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/cities/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Sectors -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="location_city"
            label="Sectores">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/sectors">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/sectors/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Authors -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="perm_identity"
            label="Autores">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/authors">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/authors/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Books -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="book"
            label="Libros">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/books">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/books/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Venues -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="calendar_today"
            label="Eventos">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/events">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/events/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Venue Reservations -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="calendar_today"
            label="Reservaciones">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/reservations">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/reservations/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <!-- Book Checkouts -->
      <q-list padding>
        <q-expansion-item
            expand-separator
            icon="calendar_today"
            label="Rentas de libros">
          <q-list padding>
            <q-item clickable v-ripple>
              <q-item-section>
                <router-link to="/book-checkouts">Lista</router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section>
                  <router-link to="/book-checkouts/create">Crear</router-link>
              </q-item-section>
            </q-item>
          </q-list>
        </q-expansion-item>
      </q-list>
      <q-item
          clickable
          v-ripple
          active-class="my-menu-link"
          @click="showLogoutConfirmation" >
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
  color: rgb(105, 0, 9);
  margin-left: 10px;
}

.extraPaddingForSideBarFirstOption {
  padding-top: 60%;

}

</style>
<script lang="ts" setup>
import {ref, Ref} from 'vue';
import {Router, useRouter} from 'vue-router';
import {Dialog, useQuasar} from "quasar";

const $q = useQuasar()
const leftDrawerOpen: Ref<boolean> = ref(false);
const miniState: Ref<boolean> = ref(true);
const router: Router = useRouter();
const showLogoutConfirmation = () => {
  $q.dialog({
    title: 'Cerrar sesión',
    message: '¿Está seguro que quiere cerrar sesión?',
    ok: {
      label: 'Sí',
      color: 'negative',
    },
    cancel: {
      label: 'No',
      color: 'positive',
    },
  }).onOk(() => {
    router.push('/');
  });
};
const goToSectorList = (): void => {
  router.push('/SectorList');
};
const goToSectorCreate = (): void => {
  router.push('/SectorCreate');
};
const goToProductList = (): void => {
  router.push('/ProductList');
};
const goToProductCreate = (): void => {
  router.push('/ProductCreate');
};
const goToAuthorsList = (): void => {
  router.push('/AuthorsList');
};
const goToAuthorsCreate = (): void => {
  router.push('/AuthorsCreate');
};
const goToSupplierCategoriesList = (): void => {
  router.push('/SupplierCategoriesList');
};
const goToSuplierCategoriesCreate = (): void => {
  router.push('/SuplierCategoriesCreate');
};
const goToSupplierTypeList = (): void => {
  router.push('/SupplierTypeList');
};
const goToSuplierTypeCreate = (): void => {
  router.push('/SuplierTypeCreate');
};
const goToEventsList = (): void => {
  router.push('/EventsList');
};
const goToEventsCreate = (): void => {
  router.push('/EventsCreate');
};
const goToReservationsList = (): void => {
  router.push('/ReservationsList');
};
const goToReservationsCreate = (): void => {
  router.push('/ReservationsCreate');
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