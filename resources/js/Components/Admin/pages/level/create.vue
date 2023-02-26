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
                        <h6 class="h6 text-muted">Create New level</h6>
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
                                <button :disabled="processing" @click.prevent="createlevel()"
                                    class="bg-blue-500 block my-3 w-auto text-white px-6 rounded tracking-wide capitalize py-2 hover:bg-indigo-700 hover:ring-1 hover:ring-indigo-700 transition-all font-semibold">
                                    {{ processing ? "Saving..." : "Create" }}
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

            async createlevel() {
                this.processing = true
                await axios.post("/api/levels", {
                    name: this.name,
                    description: this.desc
                }).then(res => {

                    console.log(res)

                    Swal.fire({
                            title: 'Saved!',
                            icon: 'success',
                            showCancelButton: true
                        })

                    this.name = ''
                    this.desc = ''

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
            document.title = "Store | Create level"
        }

    }

</script>

<style>

</style>
