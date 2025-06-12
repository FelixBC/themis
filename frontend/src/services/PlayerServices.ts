import axios from 'axios'

export interface Player {
    id: number
    first_name: string
    last_name: string
    jersey_number: string
    position: string
    team_id: number
}

const API_URL = 'http://localhost:3000' // Ajusta si es necesario

export default {
    async fetchAll(): Promise<Player[]> {
        const res = await axios.get(`${API_URL}/players`)
        return res.data
    },

    async create(player: Omit<Player, 'id'>): Promise<Player> {
        const res = await axios.post(`${API_URL}/players`, player)
        return res.data
    },

    async update(id: number, player: Partial<Player>): Promise<Player> {
        const res = await axios.put(`${API_URL}/players/${id}`, player)
        return res.data
    },

    async delete(id: number): Promise<void> {
        await axios.delete(`${API_URL}/players/${id}`)
    }
}