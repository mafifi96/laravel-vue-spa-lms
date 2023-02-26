<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800 capitalize">levels</h1>
        </div>
        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted">Edit level</h6>
                        <Errors v-if="errors" :errors="errors"></Errors>

                    </div>
                    <div class="card-body">

                        <form>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="name" name="name"
                                    placeholder="Enter level Name..." required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control form-control-user" v-model="desc" name="description"
                                    placeholder="Description"></textarea>
                            </div>

                            <div class="flex justify-center items-center">
                                <button :disabled="processing" @click.prevent="updatelevel()"
                                    class="bg-blue-500 block my-3 w-auto text-white px-6 rounded tracking-wide capitalize py-2 hover:bg-indigo-700 hover:ring-1 hover:ring-indigo-700 transition-all font-semibold">
                                    {{ processing ? "Saving..." : "save" }}
                                </button>

                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- /.container-fluid -->

</template>

<script>
import Swal from 'sweetalert2'

import Errors from '../../../inc/ValidationErrors.vue'

    export default {
        components:{
            Errors
        },
        data: function () {
            return {
                errors: "",
                name: '',
                desc: '',
                processing: false
            }
        },
        methods: {
            async getlevel() {
                await axios.get(`/api/levels/${this.$route.params.id}`).then(res => {

                    this.name = res.data.data.name
                    this.desc = res.data.data.description

                })
            },
            async updatelevel() {
                this.processing = true
                await axios.post(`/api/levels/${this.$route.params.id}`, {
                    name: this.name,
                    description: this.desc,
                    _method : "PATCH"
                }).then(res => {

                    console.log(res)

                    Swal.fire({
                            title: 'Saved!',
                            icon: 'success',
                            showCancelButton: true
                        })

                }).catch(err => {
                    console.log(err)

                    if (err && err.response.data) {
                            this.errors = err.response.data
                        } else {
                            this.errors = err.response.data.message || "something is wrong..!"
                        }
                }).finally(()=>{
                    this.processing = false
                })
            }
        },
        mounted() {
            this.getlevel()
            document.title = "Store | edit level"
        }

    }

</script>

<style>

</style>
