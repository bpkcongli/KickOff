fetch('http://localhost:8000/coaches.txt')
    .then(response => response.text())
    .then(text => { 
        let coaches = text.split('\n').splice(1);
        coaches.forEach(async coach => {
            let info = coach.split(';');
            if (info.length > 1) {
                let body = {
                    name: info[0].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                    fullname: info[1].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                    image_url_fr_internet: info[2].trim(),
                    image_url_fr_server: info[3].trim(),
                    date_of_birth: info[4].trim(),
                    place_of_birth: info[5].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                    nationality: info[6].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                    appointed: info[7].trim(),
                    contract_until: info[8].trim(),
                    team_id: parseInt(info[9]),
                };
                
                await addNewCoach(body);
            }
        });
    });

const addNewCoach = async (data) => {

    const baseUrl = "http://localhost:3000";

    await fetch(`${baseUrl}/api/kickoff/coaches`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    }).then(response => response.json()).then(json => {
        console.log(json);
    });

};