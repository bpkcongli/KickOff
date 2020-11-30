const matchCompetitionInput = document.querySelector("#matchCompetitionInput").value;
const matchDateInput = document.querySelector("#matchDateInput").value;
const matchStatusInput = document.querySelector("#matchStatusInput").value;

const homeTeamInputBtn = document.querySelector("#homeTeamInputBtn");
searchHomeTeamBtn.addEventListener("click", elem => {
    const homeTeamInput = document.querySelector("#homeTeamInput").value;
    searchTeams(homeTeamInput);
});

const searchTeams = teamName => {
    const matchCompetitionInput = document.querySelector("#matchCompetitionInput").value;
    if (matchCompetitionInput === "null") {

    } else {

    }
}

