<template>
    <div>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page header -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800 capitalize">Students</h1>

            </div>

            <!-- Content Row -->
            <div class="row">

                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <h6 class="h6 text-muted">Edit student <router-link :to="{name : 'student' , params : {id : this.$route.params.id}}">{{ student?.name }}</router-link> </h6>
                            <Errors v-if="errors" :errors="errors"></Errors>
                        </div>

                    </div>
                    <div class="card-body">
                        <form>

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="student.name"
                                    placeholder="Name" required>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" v-model="student.email"
                                    placeholder="Email" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control form-control-user" v-model="student.birth" type="date"
                                    required placeholder="Birth">
                            </div>

                            <div class="form-group">
                                <select v-model="student.level_id" class="form-control form-control-user" >
                                    <option value="" selected>Select Level</option>

                                    <option v-for="level in levels" :key="level.id" :value="level.id">
                                        {{level.name}}</option>

                                </select>
                            </div>
                            <div class="flex justify-center items-center">
                                <button :disabled="processing" @click.prevent="updateStudent()"
                                    class="bg-blue-500 block my-3 w-auto text-white px-6 rounded tracking-wide capitalize py-2 hover:bg-indigo-700 hover:ring-1 hover:ring-indigo-700 transition-all font-semibold">
                                    {{ processing ? "Saving..." : "Save" }}
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
        components: {
            Errors
        },
        data: function () {
            return {
                processing: false,
                levels: [],
                errors: '',
                student: {
                    name: "",
                    email: "",
                    birth: "",
                    level_id: ""
                }
            }
        },
        methods: {
            async updateStudent() {
                this.processing = true

                await axios.post(`/api/students/${this.student.id}`, {
                        name : this.student.name,
                        email : this.student.email ,
                        birth : this.student.birth,
                        level_id : this.student.level_id,
                        _method : "PATCH"
                     })
                    .then(res => {

                        Swal.fire({
                            title: 'Saved!',
                            icon: 'success',
                            showCancelButton: true
                        })

                    }).catch(err => {

                        if (err && err.response.data) {
                            this.errors = err.response.data
                        } else {
                            this.errors = err.response.data.message || "something is wrong..!"
                        }

                    }).finally(() => {
                        this.processing = false
                    })
            },
            async getLevels() {
                await axios.get("/api/levels")
                    .then(res => {
                        this.levels = res.data.data
                    })
            },
            async getStudent(){
                await axios.get(`/api/students/${this.$route.params.id}`)
                .then(res=>{
                    this.student = res.data.data
                })
            }
        },
        mounted() {

            this.getStudent()
            this.getLevels()

            document.title = "Store | student - Create"

        }

    }

</script>

<style>

</style>
