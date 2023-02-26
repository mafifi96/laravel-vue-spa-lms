<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800 capitalize">level</h1>
            <router-link :to="{name : 'levels.edit' , params : {id : this.$route.params.id}}"
                class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-plus fa-sm text-capitalize"></i>
                Edit level</router-link>

        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted capitalize">{{ level.name }} students ( <strong> {{ level.students_count }} </strong> ) </h6>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-bordered text-center ">
                            <thead class="capitalize">
                                <tr>
                                    <th scope="col">code</th>
                                    <th scope="col">name</th>
                                    <th scope="col">email</th>
                                    <th scope="col">birth</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(student,index) in level.students" :key="index">
                                    <td scope="row">
                                        {{student.code}}
                                    </td>
                                    <td scope="row">
                                        <router-link :to="{name :'student', params :{id : student.id}}">
                                            {{ student.name }}
                                        </router-link>
                                    </td>
                                    <td scope="row">
                                        {{ student.email }}
                                    </td>
                                    <td scope="row">
                                        {{ student.birth }}
                                    </td>



                                </tr>
                            </tbody>
                        </table>
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
                level: ""
            }
        },
        methods: {
            async getlevel() {
                await axios.get(`/api/levels/${this.$route.params.id}`).then(res => {

                    this.level = res.data.data

                })
            }

        },
        mounted() {
            this.getlevel()
            document.title = "LMS | level"

        }

    }

</script>

<style>

</style>
