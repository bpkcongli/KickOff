// Base URL untuk kebutuhan fetching data dari API
const baseUrl = "http://localhost:3000";

/*const matchCompetitionInput = document.querySelector("#matchCompetitionInput").value;
const matchDateInput = document.querySelector("#matchDateInput").value;
const matchStatusInput = document.querySelector("#matchStatusInput").value;*/

const homeTeamInputBtn = document.querySelector("#homeTeamInputBtn");
const homeTeamInput = document.querySelector("#homeTeamInput");
const searchHomeTeam = () => {
    const homeTeamInput = document.querySelector("#homeTeamInput").value;
    searchTeams(homeTeamInput).then(result => {
        const autoCompleteHomeTeam = document.querySelector("#homeTeam .autocomplete-holder");
        autoCompleteHomeTeam.innerHTML = displayAutoCompleteTeams(result);
        if (autoCompleteHomeTeam.querySelector(".autocomplete") !== null) {
            autoCompleteHomeTeam.querySelector(".autocomplete").style.display = "block";
            if (autoCompleteHomeTeam.querySelector(".autocomplete").clientHeight > 200) {
                autoCompleteHomeTeam.querySelector(".autocomplete").style.height = "200px";
                autoCompleteHomeTeam.querySelector(".autocomplete").style.overflow = "scroll";
            }
            autoCompleteHomeTeam.querySelectorAll(".autocomplete-li").forEach(elem => {
                elem.addEventListener("click", () => {
                    const teamChoice = elem.innerText;
                    document.querySelector("#homeTeamInput").value = teamChoice;
                    autoCompleteHomeTeam.querySelector(".autocomplete").style.display = "none";
                });
            });
        }
    });
};
homeTeamInputBtn.addEventListener("click", searchHomeTeam);
homeTeamInput.addEventListener("keypress", event => {
    if (event.key === "Enter") searchHomeTeam();
});

const awayTeamInputBtn = document.querySelector("#awayTeamInputBtn");
const awayTeamInput = document.querySelector("#awayTeamInput");
const searchAwayTeam = () => {
    const awayTeamInput = document.querySelector("#awayTeamInput").value;
    searchTeams(awayTeamInput).then(result => {
        const autoCompleteAwayTeam = document.querySelector("#awayTeam .autocomplete-holder");
        autoCompleteAwayTeam.innerHTML = displayAutoCompleteTeams(result);
        if (autoCompleteAwayTeam.querySelector(".autocomplete") !== null) {
            autoCompleteAwayTeam.querySelector(".autocomplete").style.display = "block";
            if (autoCompleteAwayTeam.querySelector(".autocomplete").clientHeight > 200) {
                autoCompleteAwayTeam.querySelector(".autocomplete").style.height = "200px";
                autoCompleteAwayTeam.querySelector(".autocomplete").style.overflow = "scroll";
            }
            autoCompleteAwayTeam.querySelectorAll(".autocomplete-li").forEach(elem => {
                elem.addEventListener("click", () => {
                    const teamChoice = elem.innerText;
                    document.querySelector("#awayTeamInput").value = teamChoice;
                    autoCompleteAwayTeam.querySelector(".autocomplete").style.display = "none";
                });
            }); 
        }
    });
};
awayTeamInputBtn.addEventListener("click", searchAwayTeam);
awayTeamInput.addEventListener("keypress", event => {
    if (event.key === "Enter") searchAwayTeam();
})

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
    let result = ``;
    if (teams.length > 0) {
        result += `<div class="autocomplete text-left">`;
        teams.forEach(team => {
            result += `<li class="autocomplete-li">${team}</li>`;
        })
        result += `</div>`;
    }
    return result;
};

document.querySelectorAll(".card-header-flex").forEach(elem => {
    elem.querySelector(".card-header-text button").addEventListener("click", event => {
        elem.querySelector(".card-header-submit button").disabled = !elem.querySelector(".card-header-submit button").disabled;
    });
});

const validateInput = () => {};

document.querySelectorAll(".card-header-submit button").forEach(elem => {
    elem.addEventListener("click", validateInput)
});