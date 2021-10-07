$(() => {
    const viewModel = new Vue({
        el: '#view',
        data: {
            
        },
        methods: {
            selectTrainer: (trainerId) => {
                alert("Selcted Trainer : ",trainerId);
            }
        },
        created: () => { 
            alert("Select a trainer");
        },
    });
});
