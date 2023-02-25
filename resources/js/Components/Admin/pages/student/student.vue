<template>
    <div>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page header -->
            <div class="d-sm-flex align-items-center justify-content-end mb-4">

                <router-link :to="{name :'students.create'}" class="btn btn-sm btn-primary shadow-sm mx-2"><i
                        class="fas fa-plus fa-sm "></i>
                    Create student</router-link>
                <router-link :to="{name : 'students.edit' , params : {id : this.$route.params.id}}"
                    class="btn btn-info btn-sm shadow-sm"><i class="fas fa-edit fa-sm"></i> Edit</router-link>
            </div>

            <!-- Content Row -->
            <div class="row">

                <div class="col-lg-8 col-md-12 col-sm-12 h-100">

                    <div class="card h-100">
                        <div class="card-header">
                            <h6 class="text-capitalize">student <strong>{{ student.name }}</strong></h6>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-sm border-2">
                                    <tr>
                                        <td class="font-semibold capitalize">Name</td>
                                        <td>{{ student.name }}</td>
                                        <td class="font-semibold capitalize">code</td>
                                        <td>{{ student.code }}</td>
                                        <td class="font-semibold capitalize">email</td>
                                        <td>{{ student.email }}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-semibold capitalize">birth</td>
                                        <td>{{ student.birth }}</td>
                                        <td class="font-semibold capitalize">Joined</td>
                                        <td>{{ student.created_at }}</td>
                                        <td class="font-semibold capitalize">level</td>
                                        <td>{{ student.level?.name }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-lg-4 col-md-12 col-sm-12 h-100">

                    <div class="card">
                        <div class="card-header">
                            <h6 class="text-capitalize">
                                <strong v-if="student.courses_count == 0">
                                    Student is Not Enrolled in any Course
                                </strong>
                                <strong v-if="student.courses_count != 0">
                                    student`s courses
                                    {{ student.courses_count }}
                                </strong>

                                {{
                                (student.courses_count > 1) ? " Courses" : "Course"
                            }}

                            </h6>
                        </div>

                        <div class="card-body">

                            <div class="list-group">
                                <div class="list-group-item" v-for="(course , index) in student?.courses" :key="index">
                                    <router-link class="text-slate-500 capitalize"
                                        :to="{name :'StudentCourse' , params : {cid : course.id , sid : student.id}}">{{ course.name }}
                                    </router-link>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="row mb-4 mt-4">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 my-4" v-for="(course , index) in courses" :key="index">
                            <div class="card shadow-sm">
                                <div class="card-header">
                                    <h6>
                                        <router-link class="text-slate-500 capitalize font-semibold"
                                            :to="{name :'course' , params : {id : course.id}}">{{ course.name }}
                                        </router-link>
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <p>
                                        {{excerpt(course.description)}}
                                    </p>
                                    <p class="flex flex-column space-y-2 capitalize text-slate-400 text-sm">
                                        <span>students <strong> {{ course.students_count }} </strong></span>
                                        <span>grades <strong> {{ course.grades_count }}</strong></span>
                                    </p>
                                </div>
                                <div class="card-footer p-1">
                                    <div class="flex justify-center items-center">

                                        <button v-if="enrolled(course.id)"
                                            @click.prevent="disenroll(course,index ,$event)"
                                            class="bg-gray-900 block my-3 w-auto text-white px-6 rounded tracking-wider capitalize py-2 hover:bg-indigo-700 hover:ring-1 hover:ring-indigo-700 transition-all font-lighter">
                                            disenroll
                                        </button>

                                        <button v-else @click.prevent="enroll(course , index , $event)"
                                            class="bg-blue-500 block my-3 w-auto text-white px-6 rounded tracking-wider capitalize py-2 hover:bg-indigo-700 hover:ring-1 hover:ring-indigo-700 transition-all font-semibold">
                                            enroll
                                        </button>



                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </div>
</template>

<script>
    export default {

        data: function () {
            return {
                processing: false,
                student: "",
                courses: ""
            }
        },
        methods: {
            async getstudent() {
                await axios.get(`/api/students/${this.$route.params.id}`).then(res => {

                    this.student = res.data.data

                }).catch(err => {
                    console.log(err)
                })
            },
            async getCourses() {
                await axios.get("/api/courses", {
                        header: {
                            'x-students': 'students'
                        }
                    })
                    .then(res => {
                        this.courses = res.data.data
                    })
            },
            async enroll(course, index, event) {

                event.target.textContent = "enrolling..."

                await axios.post("/api/course/enroll", {
                    course_id: course.id,
                    student_id: this.student.id
                }).then(res => {

                    this.getCourses()
                    this.getstudent()
                    event.target.textContent = "disenroll"

                }).catch((err) => {

                    event.target.textContent = "enroll"


                })
            },
            async disenroll(course, index, event) {

                event.target.textContent = "disenrolling..."

                await axios.post("/api/course/disenroll", {
                    course_id: course.id,
                    student_id: this.student.id
                }).then(res => {

                    this.getCourses()
                    this.getstudent()
                    event.target.textContent = "enroll"

                }).catch(err => {

                    event.target.textContent = "disenroll"

                })
            },
            excerpt(str) {
                return str.substring(0, 30) + "..."
            },

            enrolled(id) {
                const found = this.student.courses.find((el) => {
                    if (el.id == id) {
                        return true
                    }
                    return false

                })

                return found
            }
        },
        mounted() {
            this.getstudent()
            this.getCourses()
            document.title = "LMS | Student "


        }
    }

</script>
