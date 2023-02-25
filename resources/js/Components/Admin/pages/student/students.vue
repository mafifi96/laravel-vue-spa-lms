<template>
    <div class="container-fluid">
        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">students</h1>

            <router-link :to="{name : 'students.create'}"
                class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-plus fa-sm text-capitalize"></i>
                add student</router-link>
        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted">All students</h6>
                    </div>
                    <div class="card-body table-responsive">
                        <KeepAlive>
                            <table class="table table-bordered" id="students">
                                <thead class="text-capitalize">
                                    <tr>
                                        <th>id</th>
                                        <th>code</th>
                                        <th>Name</th>
                                        <th>email</th>
                                        <th>birth</th>
                                        <th>level</th>
                                        <th>courses</th>
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

        <div class="">

        </div>

    </div>

</template>
<script>

    export default {
        methods: {
        navigateTo(_id) {
            return this.$router.push({name : "student" , params : {id : _id}})
            }
        },
        mounted() {

            document.title = "LMS | students"

            let studentsTable = new DataTable("#students", {
                "ajax": "http://127.0.0.1:8000/api/students",
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
                        "data": "email"
                    },
                    {
                        "data": "birth"
                    },
                    {
                        "data": "level.name"
                    },
                    {
                        "data": "courses_count"
                    },
                    {
                        "data": "created_at"
                    }
                ]
            })

            document.onclick = (e)=>{

                if(e.target.classList.contains("router-link") && e.target.dataset.id > 0)
                {
                    this.navigateTo(e.target.dataset.id)
                }
            }

        }


    }

</script>

<style scoped>

</style>
