// Base URL untuk kebutuhan fetching data dari API
const baseUrl = "http://localhost:3000";

const matchCompetitionInput = document.querySelector("#matchCompetitionInput").value;
const matchDateInput = document.querySelector("#matchDateInput").value;
const matchStatusInput = document.querySelector("#matchStatusInput").value;

const homeTeamInputBtn = document.querySelector("#homeTeamInputBtn");
homeTeamInputBtn.addEventListener("click", () => {
    const homeTeamInput = document.querySelector("#homeTeamInput").value;
    searchTeams(homeTeamInput).then(result => {
        const autoCompleteHomeTeam = document.querySelector("#homeTeam .autocomplete-holder");
        autoCompleteHomeTeam.innerHTML = displayAutoCompleteTeams(result);
        autoCompleteHomeTeam.querySelector(".autocomplete").style.display = "block";
        autoCompleteHomeTeam.querySelectorAll(".autocomplete-li").forEach(elem => {
            elem.addEventListener("click", () => {
                const teamChoice = elem.innerText;
                document.querySelector("#homeTeamInput").value = teamChoice;
                autoCompleteHomeTeam.querySelector(".autocomplete").style.display = "none";
            });
        });
    });
});

const awayTeamInputBtn = document.querySelector("#awayTeamInputBtn");
awayTeamInputBtn.addEventListener("click", elem => {
    const awayTeamInput = document.querySelector("#awayTeamInput").value;
    const result = searchTeams(awayTeamInput);
    displayAutoCompleteTeams(result);
});

const searchTeams = async teamName => {
    const nicknameOfTeams  = [];
    await fetch(`${baseUrl}/api/kickoff/teams`)
        .then(response => response.json())
        .then(json => {
            const teamsData = json.response;
            teamsData.forEach(team => {
                if (team.nickname.toLowerCase().indexOf(teamName.toLowerCase()) !== -1) {
                    nicknameOfTeams.push(team.nickname);
                }
            });
        });
    
    return nicknameOfTeams;
};

const displayAutoCompleteTeams = teams => {
    let result = `<div class="autocomplete text-left">`;
    teams.forEach(team => {
        result += `<li class="autocomplete-li">${team}</li>`;
    })
    return result + `</div>`;
};