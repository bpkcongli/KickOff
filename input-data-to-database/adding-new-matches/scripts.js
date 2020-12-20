// Base URL untuk kebutuhan fetching data dari API
const baseUrl = "http://localhost:3000";

const homeTeamInputBtn = document.querySelector("#homeTeamInputBtn");
const homeTeamInput = document.querySelector("#homeTeamInput");
const awayTeamInputBtn = document.querySelector("#awayTeamInputBtn");
const awayTeamInput = document.querySelector("#awayTeamInput");

const searchTeam = options => {
    const teamInput = document.querySelectorAll(".team-input")[options].value;
    searchTeamOnDB(teamInput).then(result => {
        const chooseTeam = document.querySelectorAll(".choose-team")[options];
        const autoCompleteHolderTeam = chooseTeam.querySelector(".autocomplete-holder");
        autoCompleteHolderTeam.innerHTML = displayAutoCompleteTeams(result);
        const autocompleteTeam = autoCompleteHolderTeam.querySelector(".autocomplete");
        if (autocompleteTeam !== null) {
            autocompleteTeam.style.display = "block";
            if (autocompleteTeam.clientHeight > 200) {
                autocompleteTeam.style.height = "200px";
                autocompleteTeam.style.overflow = "scroll";
            }
            autoCompleteHolderTeam.querySelectorAll(".autocomplete-li").forEach(elem => {
                elem.addEventListener("click", () => {
                    const teamChoice = elem.innerText;
                    document.querySelectorAll(".team-input")[options].value = teamChoice;
                    autocompleteTeam.style.display = "none";
                    console.log(teamChoice);
                });
            });
        }
    });
};

const searchTeamOnDB = async teamName => {
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

homeTeamInputBtn.addEventListener("click", () => {
    searchTeam(0);
});
homeTeamInput.addEventListener("keypress", event => {
    if (event.key === "Enter") searchTeam(0);
});
awayTeamInputBtn.addEventListener("click", () => {
    searchTeam(1);
});
awayTeamInput.addEventListener("keypress", event => {
    if (event.key === "Enter") searchTeam(1);
});

document.querySelectorAll(".card-header-flex").forEach(elem => {
    elem.querySelector(".card-header-text button").addEventListener("click", event => {
        document.querySelectorAll(".card-header-submit button").forEach(elem_ => {
            if (elem.querySelector(".card-header-submit button") !== elem_) {
                elem_.disabled = true;
            }
        })
        elem.querySelector(".card-header-submit button").disabled = !elem.querySelector(".card-header-submit button").disabled;
    });
});

const validateMatchInfo = () => {
    const matchSeason = document.querySelector("#matchSeasonInput").value;
    const matchStatus = document.querySelector("#matchStatusInput").value;
    const matchDate = document.querySelector("#matchDateInput").value;
    const matchday = document.querySelector("#matchdayInput").value;
    const matchStadium = document.querySelector("#matchStadiumInput").value;
    const homeTeam = document.querySelector("#homeTeamInput").value;
    const awayTeam = document.querySelector("#awayTeamInput").value;
    const scoreHTHomeTeam = document.querySelector("#scoreHTHomeTeamInput").value;
    const scoreHTAwayTeam = document.querySelector("#scoreHTAwayTeamInput").value;
    const scoreFTHomeTeam = document.querySelector("#scoreFTHomeTeamInput").value;
    const scoreFTAwayTeam = document.querySelector("#scoreFTAwayTeamInput").value;

    const validationsValue = [
        matchSeason !== "null",
        matchStatus !== "null",
        matchDate !== "",
        matchday !== "" && matchday.match(/^[0-9]+$/) !== null,
        matchStadium !== "",
        homeTeam !== "",
        awayTeam !== "",
        scoreHTHomeTeam !== "" && scoreHTHomeTeam.match(/^[0-9]+$/) !== null,
        scoreHTAwayTeam !== "" && scoreHTAwayTeam.match(/^[0-9]+$/) !== null,
        scoreFTHomeTeam !== "" && scoreFTHomeTeam.match(/^[0-9]+$/) !== null,
        scoreFTAwayTeam !== "" && scoreFTAwayTeam.match(/^[0-9]+$/) !== null
    ]

    return validationsValue.indexOf(false) !== -1 ? false : true;
};

document.querySelector("#matchInformationValidateBtn").addEventListener("click", event => {
    console.log(validateMatchInfo());
})