<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800 capitalize">course</h1>

            <div class="btn-group">
                <router-link :to="{name : 'course.edit' , params : {id : Id }}"
                    class="d-none d-sm-inline-block ms-2 btn btn-sm btn-primary shadow-sm"><i
                        class="fas fa-edit fa-sm "></i> Edit</router-link>
                <button @click.prevent="deleteCourse()" class="d-none d-sm-inline-block ms-2 btn btn-sm btn-danger shadow-sm">
                    <i class="fas fa-trash fa-sm "></i> Delete
                </button>
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
                                    <tr class="p-2 text-center">
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
                        <h5>grades degrees</h5>

                    </div>
                    <div class="card-body table-responsive">
                        <KeepAlive>
                            <table class="table table-bordered">
                                <thead class="text-capitalize">
                                    <tr>
                                        <th>code</th>
                                        <th>Name</th>

                                        <template v-if="course.grades?.length > 0"
                                            v-for="(grade , index) in course.grades" :key="index">
                                            <th>{{ grade.name  }} - {{ grade.maxDegree }}</th>
                                        </template>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <template v-for="student , i in course.students">
                                        <tr>
                                            <td>
                                                {{ student.code }}
                                            </td>
                                            <td>
                                                {{ student.name }}
                                            </td>

                                            <template v-for="(grade , index) in course.grades" :key="index">
                                                <td>{{ grade.students[i]?.pivot?.degree || "Not updated" }}</td>
                                                <td v-if="index == course.grades?.length - 1">
                                                    {{ total(grade.students[i]?.pivot?.student_id ) }}
                                                </td>
                                            </template>


                                        </tr>
                                    </template>


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
import Swal from 'sweetalert2'

    export default {
        data: function () {
            return {
                course: {},
                Id: this.$route.params.id,

            }
        },
        methods: {
            async getcourse() {
                await axios.get("/api/courses/" + this.Id).then(res => {
                    this.course = res.data.data.course;

                }).catch(err => {
                    console.log(err.response.data)
                })
            },
            total(id) {

                let Total = 0
                this.course.grades.map((grade, index) => {

                    this.course.grades[index].students.find((el) => {
                        if (el.id == id) {
                            Total += el.pivot?.degree
                        }
                    })
                })

                return Total
            },
            deleteCourse() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then(async(result) => {

                await axios.post(`/api/courses/${this.course.id}` , {
                    _method : "DELETE"
                }).then(res=>{

                    Swal.fire(
                        'Deleted!',

                        'success'
                    ).then(()=>{
                        return this.$router.push({name :"courses"})
                    }).catch(err=>{
                        Swal.fire(
                        'failed To delete this cours!'
                    )
                    })


                })

            })
        }

        },

        mounted() {
            this.getcourse()
            //this.getStudents()
            document.title = "Store | Course"
        }
    }

</script>
