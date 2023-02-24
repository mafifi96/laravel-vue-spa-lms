<template>
     <div class="alert alert-danger m-2">
         <span v-if="errors.message && !errors.errors">{{ errors.message }}</span>

        <ul class="px-3 list-disc" v-if="errors.errors">

                <li v-for="message,i in errors.errors" :key="i" class="text-md">
                    {{ message[0] }}
                </li>
        </ul>
    </div>

</template>

<script>
    export default {
        props: ['errors']
    }

</script>
