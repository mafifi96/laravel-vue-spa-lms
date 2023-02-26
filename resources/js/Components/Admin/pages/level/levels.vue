<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800 capitalize">levels</h1>

            <router-link :to="{name : 'levels.create'}"
                class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-plus fa-sm text-capitalize"></i>
                Create level</router-link>

        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted text-uppercase">all levels</h6>
                        <p class="text-sm">go to student`s page and upgrade their level</p>

                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-bordered text-center ">
                            <thead class="capitalize">
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">name</th>
                                    <th scope="col">students</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(level,index) in levels" :key="index">
                                    <td scope="row">
                                        <router-link :to="{name :'level', params :{id : level.id}}">
                                            {{level.id}}
                                        </router-link>
                                    </td>
                                    <td scope="row">
                                        <router-link :to="{name :'level', params :{id : level.id}}">
                                            {{level.name}}
                                        </router-link>
                                    </td>

                                    <td>{{level.students_count}}</td>
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
                levels: []
            }
        },
        methods: {
            async getlevels() {
                await axios.get("/api/levels").then(res => {

                    this.levels = res.data.data

                })
            }

        },
        mounted() {
            this.getlevels()
            document.title = "LMS | levels"

        }

    }

</script>

<style>

</style>
