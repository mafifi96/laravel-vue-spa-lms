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

        methods:{
            navigateTo(_id) {
            return this.$router.push({name : "course" , params : {id : _id}})
            }
        },
        mounted() {

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
                        "data": "name",
                        "render": function (data, type, row, meta) {

                            return `<button data-id="${row.id}"  class="router-link block cursor-pointer apperance-none">${row.name}</button>`
                        }

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

            document.onclick = (e) => {

                if (e.target.classList.contains("router-link") && e.target.dataset.id > 0) {
                    this.navigateTo(e.target.dataset.id)
                }
            }

        },

    }

</script>

<style scoped>

</style>
