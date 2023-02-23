<script>

    export default {
        data: function () {
            return {
                level: {},
                students : {},
                ID: this.$route.params.id,

            }
        },
        methods: {
            async getlevel() {
                await axios.get("/api/levels/" + this.ID).then(res => {
                    this.level = res.data.level
                    console.log(res.data)

                }).catch(err => {
                    console.log(err)
                })
            }

        },
        watch: {
            ID: function () {
                this.getlevel()
            }
        },
        mounted() {
            this.getlevel()
            document.title = "Store | level - " + this.ID

        }

    }

</script>

<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">levels</h1>
        </div>
        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h6>
                            level Number <strong>{{level.id}}</strong>
                        </h6>
                        <h6>student <strong>{{student.name}}</strong>
                        </h6>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-bleveled table-sm">
                            <thead>
                                <td scope="col">#</td>
                                <td scope="col">Product</td>
                                <td scope="col">Quantity</td>
                                <td scope="col">Price</td>
                                <td scope="col">leveled at</td>
                            </thead>
                            <tr v-for="(product , index) in level.products" :key="index">
                                <td>{{(index + 1)}}</td>
                                <td>
                                    <router-link :to="{name : 'admin.products.product'  ,params :{ id :product.id}}">
                                        {{product.title}}</router-link>
                                </td>
                                <td>{{product.pivot.quantity}}</td>
                                <td>&dollar;{{currency(product.price)}}</td>
                                <td>{{formateDate(level.created_at) }}</td>
                            </tr>
                            <tr>
                                <td colspan="3">Total Price</td>
                                <td colspan="1">&dollar;{{currency(level.total_price)}}</td>
                            </tr>
                            <tr>
                                <td colspan="4">Status</td>
                                <td colspan="1" class="m-1">
                                    <select v-model="status" class="form-select form-select-xsm ">
                                        <option value="shipping" :selected="level.status == 'shipping'">
                                            Shipping</option>
                                        <option value="canceled" :selected="level.status == 'canceled'">
                                            Canceled</option>
                                        <option value="shipped" :selected="level.status == 'shipped'">Shipped</option>

                                    </select>

                                </td>
                            </tr>

                        </table>
                    </div>


                </div>

            </div>

        </div>
    </div>

</template>


<style>

</style>
