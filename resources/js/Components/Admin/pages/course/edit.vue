<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">courses</h1>

        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted">Create New course</h6>
                        <Errors v-if="errors" :errors="errors"></Errors>

                    </div>
                    <div class="card-body">

                        <form>

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="course.name"
                                    name="name" placeholder="Enter course Name..." required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control form-control-user" v-model="course.description"
                                    name="description" placeholder="Description"></textarea>
                            </div>
                            <div class="my-3">
                                <h4 class="text-capitalize mb-2">grades</h4>
                                <span v-if="grades.length == 0">No grades in this course</span>
                                <div v-if="grades.length > 0" class="flex justify-center items-center space-x-2"
                                    v-for="(grade , index) in grades" :key="index">
                                    <div class="flex-[70%]">
                                        <input type="text" placeholder="grade name"
                                            class="w-full p-2 rounded appearance-none border ring-inset shadow-sm"
                                            v-model="grades[index].name">

                                    </div>
                                    <div class="flex-[20%]">
                                        <input type="number"
                                            class="w-full p-2 rounded appearance-none border ring-inset shadow-sm"
                                            v-model="grades[index].maxDegree" placeholder="grade degree">
                                    </div>
                                    <div class="flex-[10%] items-center">
                                        <button @click.prevent="deleteGrade(index,grades[index].id)"
                                            class="bg-black block my-3 w-auto text-white  rounded tracking-wide capitalize p-2 hover:bg-red-600 transition-all text-sm">
                                            <i class="fa fa-times"></i>

                                        </button>

                                    </div>
                                </div>

                            </div>
                            <div>
                                <button @click.prevent="addgrade()"
                                    class="bg-black block my-3 w-auto text-white  rounded tracking-wide capitalize p-2 hover:bg-indigo-700 hover:ring-1 hover:ring-indigo-700 transition-all text-sm">
                                    add grade <i class="fa fa-plus text-xs"></i>

                                </button>

                            </div>

                            <div class="flex justify-center items-center">
                                <button :disabled="processing" @click.prevent="updatecourse()"
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
    import Errors from '../../../inc/ValidationErrors.vue'

    export default {
        components: {
            Errors
        },
        data: function () {
            return {
                errors: '',
                saved: false,
                message: '',
                course: {
                    name: "",
                    description: ""
                },
                grades: [{
                    name: "",
                    maxDegree: ""
                }],
                processing: false
            }
        },
        methods: {
            addgrade() {
                this.grades.push({
                    id: "",
                    name: "",
                    maxDegree: ""
                })
            },
            async getcourse() {
                await axios.get("/api/courses/" + this.$route.params.id).then(res => {
                    this.course = res.data.data.course;
                    this.grades = res.data.data.grades;

                }).catch(err => {
                    console.log(err.response.data.errors)
                })
            },
            async updatecourse() {
                this.processing = true
                await axios.post(`http://127.0.0.1:8000/api/courses/${this.$route.params.id}`, {
                    name: this.course.name,
                    description: this.course.description,
                    grades: this.grades,
                    _method: "PATCH"
                }).then(res => {

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

                }).finally(() => {
                    this.processing = false
                })
            },
            async deleteGrade(index, id) {

                this.grades.splice(index, 1)

                if (id) {
                    await axios.post(`http://127.0.0.1:8000/api/grades/${id}`, {
                        _method: "DELETE"
                    }).catch((err => {
                        console.log(err)
                    }))

                }
            }
        },
        mounted() {
            this.getcourse()
            document.title = "Store | Create course"
        }

    }

</script>

<style>

</style>
