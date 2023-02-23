<template>
    <div class="alert alert-danger m-2">
        <ul>
            <li v-for="error in errors" :key="error" class="text-sm">
                {{ error[0] }}
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        props: ['errors']
    }

</script>
