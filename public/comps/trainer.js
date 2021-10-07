$(() => {
    const redirectToRoot = () => { location.replace("/trainers");  }
    const viewModel = new Vue({
        el: '#view',
        data: {
            trainer: {},
        },
        methods: {
            blandMethod() {
                
            }
        },
        created() {
            console.log("Loading Trainer Model");
        },
    });
});
