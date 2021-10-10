$(() => {
    const redirectToRoot = () => { location.replace("/trainers");  }
    const viewModel = new Vue({
        el: '#view',
        data: {
            TRAINER_ID_KEY: "trainer_id",
            trainer: {},
        },
        methods: {
            blandMethod() {
                
            }
        },
        created() {
            if(!localStorage.getItem(this.TRAINER_ID_KEY)) {
                redirectToRoot();
                return;
            }
            console.log("Loading Trainer Model");
            document.getElementById("model").textContent
        },
    });
});