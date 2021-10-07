$(() => {
    const redirectToTrainerPage = (trainerId) => {
        window.location.replace("/trainers/" + trainerId);
    }
    const viewModel = new Vue({
        el: '#view',
        data: {
            TRAINER_ID_KEY: "trainer_id",
        },
        methods: {
            selectTrainer(trainerId) {
                const yes = confirm("Are you sure?");
                if (yes) {
                    window.localStorage.setItem(this.TRAINER_ID_KEY, trainerId);
                    redirectToTrainerPage(trainerId);
                } else {
                    // ...
                }
            }
        },
        created() {
            let trainerId = window.localStorage.getItem(this.TRAINER_ID_KEY);
            if (trainerId !== null) { // Redirect to Trainer page
                redirectToTrainerPage(trainerId)
            }
            console.log("Select a trainer");
        },
    });
});
