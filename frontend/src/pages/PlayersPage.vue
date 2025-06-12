<template>
  <q-page padding>
    <h2>Players</h2>

    <q-form @submit.prevent="createPlayer">
      <q-input filled v-model="newPlayer.first_name" label="First Name" />
      <q-input filled v-model="newPlayer.last_name" label="Last Name" />
      <q-input filled v-model="newPlayer.jersey_number" label="Jersey Number" />
      <q-input filled v-model="newPlayer.position" label="Position" />
      <q-input filled type="number" v-model="newPlayer.team_id" label="Team ID" />
      <q-btn type="submit" label="Add Player" color="primary" class="q-mt-md" />
    </q-form>

    <q-separator class="q-my-md" />

    <q-list bordered>
      <q-item v-for="player in players" :key="player.id">
        <q-item-section>
          <div>{{ player.first_name }} {{ player.last_name }} (#{{ player.jersey_number }}) - {{ player.position }}</div>
        </q-item-section>
        <q-item-section side>
          <q-btn flat round icon="delete" color="negative" @click="deletePlayer(player.id)" />
        </q-item-section>
      </q-item>
    </q-list>
  </q-page>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import PlayersService, { type Player } from 'src/services/PlayersService'

const players = ref<Player[]>([])
const newPlayer = ref<Omit<Player, 'id'>>({
  first_name: '',
  last_name: '',
  jersey_number: '',
  position: '',
  team_id: 0
})

async function loadPlayers() {
  players.value = await PlayersService.fetchAll()
}

async function createPlayer() {
  await PlayersService.create(newPlayer.value)
  await loadPlayers()
  newPlayer.value = { first_name: '', last_name: '', jersey_number: '', position: '', team_id: 0 }
}

async function deletePlayer(id: number) {
  await PlayersService.delete(id)
  await loadPlayers()
}

onMounted(loadPlayers)
</script>
