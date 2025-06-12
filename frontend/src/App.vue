<template>
  <div id="q-app">
    <router-view></router-view>
  </div>
</template>

<script>
import MainLayout from './components/MainLayout.vue';

export default {
  name: 'App',
  components: {
    MainLayout,
  },
};
</script>
<style lang="css">

</style>