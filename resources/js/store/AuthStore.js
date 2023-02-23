import { defineStore } from 'pinia'


export const useAuthStore = defineStore('auth', {

    state : () =>({
        authenticated: false,
            user: {},
    })
    ,
    getters : {
        authUser : (state) => state.user,

        isAuthenticated : (state) => state.authenticated
    },

    actions : {
        sign
    }
})
