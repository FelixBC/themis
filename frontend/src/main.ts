// FILE: main.js

import { createApp } from 'vue';
import {Quasar, Notify, Dialog} from 'quasar';

// Import icon libraries
import '@quasar/extras/roboto-font/roboto-font.css';
import '@quasar/extras/material-icons/material-icons.css';
import '@quasar/extras/material-icons-sharp/material-icons-sharp.css';

// A few examples for animations from Animate.css:
// import @~quasar/extras/animate/fadeIn.css
// import @~quasar/extras/animate/fadeOut.css

// Import Quasar css
import 'quasar/src/css/index.sass'

// Assumes your root component is App.vue
// and placed in same folder as main.js
import App from './App.vue'
import router from "./router/router.ts";

const myApp = createApp(App)
myApp.use(router)
myApp.use(Quasar, {

    plugins: {
        Notify,
        Dialog
    }, // import Quasar plugins and add here
})

// Assumes you have a <div id="app"></div> in your index.html
myApp.mount('#app')
