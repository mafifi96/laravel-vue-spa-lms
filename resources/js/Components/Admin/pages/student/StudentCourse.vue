<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800 text-capitalize">course</h1>

            <!-- <div class="btn-group">

                <router-link :to="{name : 'course.edit' , params : {cid :  course?.id}}"
                    class="d-none d-sm-inline-block ms-2 btn btn-sm btn-primary shadow-sm"><i
                        class="fas fa-edit fa-sm "></i> Edit course</router-link>

            </div>
             -->
        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header ">
                        <h6>save <strong><router-link :to="{name : 'student' , params: {id : this.$route.params.sid}}"
                    class="font-semibold text-slate-600"> {{student.name }}
                    </router-link>
</strong> degrees</h6>
                    </div>
                    <div class="card-body table-responsive">
                        <KeepAlive>
                            <table class="table table-bordered">
                                <thead class="text-capitalize">
                                    <tr>
                                        <th>id</th>
                                        <th>code</th>
                                        <th>Name</th>
                                        <th>Careated At</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>{{course.id}}</td>
                                        <td>{{course.code}}</td>
                                        <td>{{course.name}}</td>
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
                        <h4> <strong>{{ course.students_count }}</strong> enrolled student`s grades degrees</h4>

                    </div>
                    <div class="card-body table-responsive">
                        <KeepAlive>
                            <table class="table table-bordered">
                                <thead class="text-capitalize">
                                    <tr>
                                        <th width="60%">Grade</th>
                                        <th width="40%">Student Degree</th>
                                    </tr>
                                </thead>
                                <tbody class="text-capitalize">

                                        <tr v-for="(grade , index) in grades" :key="index">

                                            <td>
                                                {{grade.name}}
                                            </td>
                                            <td>
                                                    <input type="number"
                                                        class="w-full p-2 rounded appearance-none border ring-inset shadow-sm"
                                                        v-model="grades[index].maxDegree"
                                                        :placeholder="'Grade`s Max Degree' + grades[index].maxDegree">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="100%">

                                                <div v-if="grades" class="flex justify-center items-center">
                                                    <button :disabled="processing" @click.prevent="saveDegrees()"
                                                        class="bg-blue-500 block my-3 w-auto text-white px-6 rounded tracking-wide capitalize py-2 hover:bg-indigo-700 hover:ring-1 hover:ring-indigo-700 transition-all font-semibold">
                                                        {{ processing ? "Saving..." : "Save" }}
                                                    </button>

                                                </div>

                                            </td>
                                        </tr>

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
import { nextTick } from 'vue';

    export default {
        data: function () {
            return {
                processing: false,
                course: "",
                student: "",
                grades: []
            }
        },
        methods: {
            async getcourse() {
                await axios.get(`/api/courses/${this.$route.params.cid}/students/${this.$route.params.sid}`).then(
                    res => {

                        this.course = res.data.data.course;
                        this.grades = res.data.data.grades;
                        this.student = res.data.data.student;

                    }).catch(err => {
                        //this.$router.push({name : 'NotFound'})
                    console.log(err.response.data)
                })
            },

            async saveDegrees() {
                this.processing = true
                await axios.post(`/api/students/${this.$route.params.sid}/grades` , {
                    grades : this.grades
                }).then(res=>{
                    Swal.fire({
                            title: 'Saved!',
                            icon: 'success',
                            showCancelButton: true
                        })

                }).finally(()=>{
                    this.processing = false
                })

            }

        },
        mounted() {
            this.getcourse()
/*
            nextTick(()=>{

                this.getcourse()

            }) */
            //this.getStudents()
            document.title = "Store | Course"
        }
    }

</script>
