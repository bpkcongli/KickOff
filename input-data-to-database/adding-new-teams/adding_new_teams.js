fetch('http://localhost:8000/teams.csv')
    .then(response => response.text())
    .then(csv => { 
        let data = csv.split('\n').splice(1);
        data.forEach(each => {
            let info = each.split(';');
            let body = {
                name: info[0].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                logo_url: info[1].trim(),
                description: info[2].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                address: info[3].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                location: info[4].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                phone: info[5].trim(),
                website: info[6].trim(),
                founded_year: info[7].trim(),
                stadium: info[8].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim(),
                ceo: info[9].replaceAll(`'`, `\\'`).replaceAll(`"`, `\\"`).trim()
            };
            
            addNewTeam(body);
        });
    });

const addNewTeam = (data) => {

    const baseUrl = "http://localhost:3000";

    fetch(`${baseUrl}/api/kickoff/teams`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    }).then(response => response.json()).then(json => {
        alert('Data berhasil di-input ke database.');
        console.log(json);
    });

};