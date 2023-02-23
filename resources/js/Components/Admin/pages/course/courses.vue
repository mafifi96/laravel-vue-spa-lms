<template>
    <div class="container-fluid">
        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">courses</h1>

            <router-link :to="{name : 'course.create'}"
                class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-plus fa-sm text-capitalize"></i>
                Create course</router-link>

        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted">All courses</h6>
                    </div>
                    <div class="card-body table-responsive">
                        <KeepAlive>
                            <table class="table table-bordered" id="courses">
                                <thead class="text-capitalize">
                                    <tr>
                                        <th>id</th>
                                        <th>code</th>
                                        <th>Name</th>
                                        <th>grades</th>
                                        <th>enrolled students</th>
                                        <th>Careated At</th>

                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </KeepAlive>
                    </div>
                </div>
            </div>

        </div>

    </div>

</template>
<script>
    export default {
        data: function () {

            return {
                courses: []
            }
        },
        methods: {
            getCourses() {
                axios.get("/api/courses").then(res => {
                    this.courses = res.data.data;
                    console.log(res.data)
                }).catch(err => {
                    console.log(err)
                })
            }
        },
        mounted() {
            // this.getCourses()
            document.title = "LMS | Courses"


            let table = new DataTable("#courses", {

                "ajax": "http://127.0.0.1:8000/api/courses",
                "columns": [{
                        "data": "id"
                    },
                    {
                        "data": "code"
                    },
                    {
                        "data": "name"
                    },
                    {
                        "data": "grades_count"
                    },
                    {
                        "data": "students_count"
                    },
                    {
                        "data": "created_at"
                    }
                ]
            });

        },

    }

</script>

<style scoped>

</style>
