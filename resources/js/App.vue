<template>
    <div>

        <component :is="layout"></component>

    </div>
</template>
<script>
    import DefaultLayout from './Layouts/DefaultLayout.vue'
    import AdminLayout from './Layouts/AdminLayout.vue'

    export default {
        components: {
            DefaultLayout,
            AdminLayout,
        },
        data: function () {
            return {
                DefaultLayout: "DefaultLayout"
            }
        },
        computed: {
            layout() {
                return this.$route.meta.layout ? this.$route.meta.layout : this.DefaultLayout
            }
        }

    }

</script>
