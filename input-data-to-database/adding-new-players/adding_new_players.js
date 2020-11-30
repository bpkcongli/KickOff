fetch('http://localhost:8000/players.txt')
    .then(response => response.text())
    .then(text => { 
        let players = text.split('\n').splice(1);
        players.forEach(player => {
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
                
                addNewPlayer(body);
            }
        });
    });

const addNewPlayer = data => {

    const baseUrl = "http://localhost:3000";

    fetch(`${baseUrl}/api/kickoff/players`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    }).then(response => response.json()).then(json => {
        console.log(json);
    });

};