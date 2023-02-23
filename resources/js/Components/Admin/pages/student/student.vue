<template>
    <div>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page header -->
            <div class="d-sm-flex align-items-center justify-content-end mb-4">

                <router-link :to="{name :'students.create'}" class="btn btn-sm btn-primary shadow-sm mx-2"><i
                        class="fas fa-plus fa-sm "></i>
                    Create student</router-link>
                <router-link :to="'/students/'+student.id" class="btn btn-info btn-sm shadow-sm"><i
                        class="fas fa-edit fa-sm"></i> Edit</router-link>
            </div>

            <!-- Content Row -->
            <div class="row">

                <div class="col-lg-8 col-md-12 col-sm-12">

                    <div class="card">
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

                <div class="col-lg-4 col-md-12 col-sm-12">

                    <div class="card">
                        <div class="card-header">
                            <h6 class="text-capitalize">student`s courses
                                <strong>
                                    {{ student.courses_count }}
                                </strong>

                                {{
                                (student.courses_count > 1) ? " Courses" : "Student is Not Enrolled in any Course"
                            }}

                            </h6>
                        </div>

                        <div class="card-body">

                            <div class="accordion" id="oaccordion">

                                <div class="accordion-item" v-for="(course , index) in student?.courses" :key="index">
                                    <h2 class="accordion-header" :id="'oheading'+index">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" :data-bs-target="'#ocollapse'+index"
                                            aria-expanded="false" :aria-controls="'ocollapse'+index">
                                            {{course.name}}
                                        </button>
                                    </h2>
                                    <div :id="'ocollapse'+index" class="accordion-collapse collapse"
                                        :aria-labelledby="'oheading'+index" data-bs-parent="#oaccordion">
                                        <div class="accordion-body table-responsive">
                                            <table class="table ">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">name</th>
                                                        <th scope="col">quantity</th>
                                                        <th scope="col">price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
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
                student: {}
            }
        },
        methods: {
            async getstudent() {
                await axios.get(`/api/students/${this.$route.params.id}`).then(res => {

                    this.student = res.data.data

                }).catch(err => {
                    console.log(err)
                })
            }
        },
        mounted() {
            this.getstudent()
            document.title = "LMS | Student "

        }
    }

</script>
