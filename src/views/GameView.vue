<template>
    <div class="container">
		<canvas width="496" height="272" id="background"></canvas>
		<canvas width="496" height="272" id="entities"></canvas>
		<canvas width="496" height="272" id="player"></canvas>

		<div class="user-interface">

			<h1 style="color: white">{{ debug_name }}</h1>
			<Window :title="lg('settings')" id="settings_window" width="30vw" height="45vh" draggable>
				<template v-slot:>
					<SettingsModule />
				</template>
			</Window>

			<Window :title="lg('mailbox')" id="test_window" width="25vw" height="50vh"  draggable>
				<template v-slot:>
					<MailModule />
				</template>
			</Window>
			
			<Window :title="lg('create_village')" id="village_window" width="25vw" height="50vh" display draggable>
				<template v-slot:>
					<VillageModule />
				</template>
			</Window>

			<ToolbarModule />

			<ChatModule />
		</div>
	</div>
</template>

<script setup>
import { keydownHandler } from '../game/events.js'

import lg from '../locales/lg.js'

import Window from '../components/Window.vue'

import SettingsModule from '../modules/SettingsModule.vue'
import ToolbarModule from '../modules/ToolbarModule.vue'

import ChatModule from '../modules/ChatModule.vue'
import VillageModule from '../modules/VillageModule.vue'
import MailModule from '../modules/MailModule.vue'

document.title = "CityProject"


/*
let account_name = ref('')

const options = {
	method: 'GET',
	credentials: "include",
	headers: {
		'Content-Type': 'application/x-www-form-urlencoded',
	}
}

fetch(`http://localhost:3000/api/account/profile?=`, options)
.then(response => response.json())
.then(response => {
	console.log(response)
	account_name.value = response.username
})
.catch(err => console.error(err))*/

// Events handling

// Graphics
import { ref, onMounted } from 'vue'

import GraphicsEngine from '../game/engine.js'
import MapGrid from '../game/engine/grid.js'
import Sprite from '../game/engine/sprite.js'

import { socket, init} from "@/api/socket/socket.js";


let debug_name = ref('e')
init()

onMounted(() => {
	document.addEventListener("keydown", (event) => keydownHandler(event, socket))

	// DEBUG START
	function parseJwt (token) {
		var base64Url = token.split('.')[1];
		var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
		var jsonPayload = decodeURIComponent(window.atob(base64).split('').map(function(c) {
			return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		}).join(''));

		return JSON.parse(jsonPayload);
	}

	debug_name.value = parseJwt(document.cookie.split(';').find(row => row.startsWith('token')).split('=')[1]).character_name
	// DEBUG END

	const engine = new GraphicsEngine(socket, document.querySelectorAll('canvas'))

	const map_grid = new MapGrid(engine)

	socket.on('pull_map_part', (data) => {
		console.log("i", data) 
		map_grid.drawMap(data.map_part)
	})

	const player_sprite = new Sprite(engine)
	player_sprite.draw()
})
</script>

<style type="sass">
@import "../assets/gui.sass";
</style>