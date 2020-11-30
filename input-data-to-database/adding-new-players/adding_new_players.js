fetch('http://localhost:8000/players.txt')
    .then(response => response.text())
    .then(text => { 
        let data = text.split('_-_-_').splice(1);
        data.forEach(playersOnTeam => {
            let players = playersOnTeam.split('\n');
            players.forEach(async player => {
                let info = player.split(';');
                if (info.length > 1) {
                    let body = {
                        name: info[0].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                        image_url_fr_internet: info[1].trim(),
                        image_url_fr_server: info[2].trim(),
                        date_of_birth: info[3].trim(),
                        place_of_birth: info[4].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                        nationality: info[5].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                        height: parseFloat(info[6]),
                        prefer_position_id: parseInt(info[7]),
                        position_id: parseInt(info[8]),
                        team_id: parseInt(info[9]),
                        shirt_number: info[10] !== '-' ? info[10].trim() : null,
                        rating: info[11] !== '-' ? parseInt(info[11]) : null
                    };
                    
                    await addNewPlayer(body);
                }
            });
        });
    });

const addNewPlayer = async (data) => {

    const baseUrl = "http://localhost:3000";

    await fetch(`${baseUrl}/api/kickoff/players`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    }).then(response => response.json()).then(json => {
        console.log(json);
    });

};