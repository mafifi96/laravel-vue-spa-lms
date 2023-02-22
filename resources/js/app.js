import './assets'

import './bootstrap';

//import { createApp } from 'vue/dist/vue.esm-bundler'
import { createApp } from 'vue';

import { createPinia } from 'pinia';

import App from './App.vue'

import router from './routes'

const pinia = createPinia()

const app = createApp(App)

app.use(pinia).use(router).mount("#app")

