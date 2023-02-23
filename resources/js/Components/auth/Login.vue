<template>

    <div class="col-md-12 col-lg-12 col-sm-12 ">
        <div class="row">
            <div class="container">
                <!-- Outer Row -->
                <div class="row justify-content-center">

                    <div class=" col-md-6">

                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">

                                    <div class="col-md-12">

                                        <div class="p-5">
                                            <div class="text-center">
                                                <h1 class="h4 text-gray-900 mb-4 text-capitalize">Welcome Back!
                                                </h1>
                                            </div>
                                            <Errors :errors="errors"></Errors>

                                            <form class="user" @submit.prevent="login" >

                                                <input type="hidden" name="_token" :value="csrf">
                                                <div class="form-group">
                                                    <input type="email" class="form-control form-control-user"
                                                        v-model="creds.email"  name="email"
                                                         placeholder="Email"                                                 required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user"
                                                        v-model="creds.password"
                                                        name="password" placeholder="Password" required >
                                                </div>
                                                <div class="form-group">
                                                    <div class="custom-control custom-checkbox small">
                                                        <input type="checkbox" class="custom-control-input"
                                                            id="customCheck" name="remember">
                                                        <label class="custom-control-label"
                                                            for="customCheck">remember me</label>
                                                    </div>
                                                </div>
                                                <button :disabled=processing
                                                    class="btn btn-primary btn-user btn-block text-capitalize">
                                                    {{processing ? "login..." : "login"}}
                                                </button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

</template>

<script>
import Errors from '../inc/ValidationErrors.vue'

    export default {
        components:{
            Errors
        },
        data() {
            return {
                errors: null,
                processing: false,
                creds: {
                    email: '',
                    password: '',
                }
            }
        },
        methods: {

            async login() {
                this.processing = true
                //await axios.get('/sanctum/csrf-cookie')
                await axios.post('/api/login', this.creds).then(res => {

                    console.log(res)

                }).catch(err => {
                    this.errors = err.response.data.errors;
                    //console.log(err)
                }).finally(() => {
                    this.processing = false
                })
            },
            redirectAuth() {
                if (this.store.getters.isAuthenticated) {
                    this.$router.push({
                        name: 'dashboard'
                    })
            }
        }

        },
        watch: {
            '$store.getters.authenticated': function () {
                this.redirectAuth()
            }
        },
        created() {
            document.title = "Store | Login"
        },
        mounted() {

        }
    }

</script>
