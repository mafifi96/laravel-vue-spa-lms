<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800 text-capitalize">course</h1>

            <div class="btn-group">
                <router-link :to="{name : 'course.create'}"
                    class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm "></i>
                    Create course</router-link>

                <router-link :to="{name : 'course.edit' , params : {id : Id }}"
                    class="d-none d-sm-inline-block ms-2 btn btn-sm btn-primary shadow-sm"><i
                        class="fas fa-edit fa-sm "></i> Edit course</router-link>
            </div>
        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header ">
                        <h4>{{ course.name }}</h4>
                    </div>
                    <div class="card-body table-responsive">
                        <KeepAlive>
                            <table class="table table-bordered">
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

                                    <tr>
                                        <td>{{course.id}}</td>
                                        <td>{{course.code}}</td>
                                        <td>{{course.name}}</td>
                                        <td>{{course.grades_count}}</td>
                                        <td>{{course.students_count}}</td>
                                        <td>{{course.created_at}}</td>
                                    </tr>

                                    <tr class="p-3 text-center font-bold text-capitalize">
                                        <td colspan="100%">description</td>
                                    </tr>
                                    <tr class="p-2 text-center text-justify">
                                        <td colspan="100%">{{ course.description }}</td>
                                    </tr>


                                </tbody>
                            </table>
                        </KeepAlive>

                    </div>
                </div>
            </div>

            <div class="col-md-12">

                <div class="card mt-3">
                    <div class="card-header text-capitalize">
                        <h4> <strong>{{ course.students_count }}</strong> enrolled student`s grades degrees</h4>

                    </div>
                    <div class="card-body table-responsive">
                        <KeepAlive>
                            <table class="table table-bordered">
                                <thead class="text-capitalize">
                                    <tr>
                                        <th>code</th>
                                        <th>Name</th>

                                        <template v-if="grades.length > 0" v-for="(grade , index) in grades" :key="index">
                                            <th>{{ grade.name  }} - {{ grade.maxDegree }}</th>
                                        </template>

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
    <!-- /.container-fluid -->

</template>
<script>
    export default {
        data: function () {
            return {
                course: {},
                students: [],
                grades: [],
                Id: this.$route.params.id
            }
        },
        methods: {
            async getcourse() {
                await axios.get("/api/courses/" + this.Id).then(res => {
                    this.course = res.data.data.course;
                    this.grades = res.data.data.grades;

                }).catch(err => {
                    console.log(err.response.data)
                })
            }

        },
        /* watch: {
             'Id':function()
             {
                 this.getcourse()
             }
            } */
        mounted() {
            this.getcourse()
            //this.getStudents()
            document.title = "Store | Course"
        }
    }

</script>
