// // Prerequisite
const express = require('express');
const sql = require('mysql');
const bodyParser = require('body-parser');
const { response } = require('express');

// Create an Express application and initialize the port 
// that will be used by the express app
const app = express();
const port = 3000;

// Middleware to enable Cross Origin Resource Sharing
// so a front-end can use application/json as a Content-type
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

// Middleware to transform a request body to JSON format
app.use(bodyParser.json());

// Create new connection to the database
const conn = sql.createConnection({
    user: 'root',
    password: 'Udukcongli28*',
    host: 'localhost',
    database: 'football_api'
});

// Trying to connect...
conn.connect((err) => {
    if (err) throw err;
    else console.log('MySQL Server has been connected...');
});

// Simple endpoint 
app.get('/', (req, res) => {
    res.send('Halo Dunia!');
});

// GET all areas ... /api/kickoff/areas
app.get('/api/kickoff/areas', (req, res) => {
    const sql = `SELECT * FROM areas`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// GET a specific area ... /api/kickoff/area/:id
app.get('/api/kickoff/area/:id', (req, res) => {
    const sql = `SELECT * FROM areas WHERE id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results[0]
        });
    });
});

// GET all competitions ... /api/kickoff/competitions
app.get('/api/kickoff/competitions', (req, res) => {
    const sql = `SELECT * FROM competitions`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// GET a specific competition ... /api/kickoff/competition/:id
app.get('/api/kickoff/competition/:id', (req, res) => {
    let sql = `SELECT * FROM competitions WHERE id=${req.params.id}`;
    let response, created_at, last_modified;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else {
            response = {
                id: results[0]['id'],
                name: results[0]['name'],
                logo_url: results[0]['logo_url'],
                area_id: results[0]['area_id']
            };
            created_at = results[0]['created_at'];
            last_modified = results[0]['last_modified'];
        }
    });
    sql = `SELECT * FROM seasons WHERE competition_id=${req.params.id} ORDER BY year DESC`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else {
            response['seasons'] = results;
            response['created_at'] = created_at;
            response['last_modified'] = last_modified;
            res.json({
                status: 200,
                err: null,
                response: response
            });
        }
    });
});

// GET a specific season ... /api/kickoff/season/:id
app.get('/api/kickoff/season/:id', (req, res) => {
    const sql = `SELECT * FROM seasons WHERE id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results[0]
        });
    });
});

// GET a specific standing from a season competition ... /api/kickoff/season/:id/standings
app.get('/api/kickoff/season/:id/standings', (req, res) => {
    let sql = `SELECT * FROM seasons WHERE id=${req.params.id}`;
    let response, season, standings;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else season = results[0];
    });
    sql = `SELECT * FROM standings WHERE season_id=${req.params.id} ORDER BY points DESC`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else {
            standings = [];
            results.forEach(each => {
                standings.push({
                    id: each['id'],
                    team_id: each['team_id'],
                    plays: each['plays'],
                    wins: each['wins'],
                    draws: each['draws'],
                    losses: each['losses'],
                    goals_against: each['goals_against'],
                    goals_for: each['goals_for'],
                    goals_difference: each['goals_difference'],
                    points: each['points'],
                    last_five_matches: each['last_five_matches'],
                });
            });
        }
        response = {
            id: season['id'],
            year: season['year'],
            start_date: season['start_date'],
            end_date: season['end_date'],
            current_matchday: season['current_matchday'],
            number_of_matches: season['number_of_matches'],
            winner_team_id: season['winner_team_id'],
            competition_id: season['competition_id'],
            standings: standings,
            created_at: season['created_at'],
            last_modified: season['last_modified']
        };
        res.json({
            status: 200,
            err: null,
            response: response
        });
    });
});

// POST a new standing ... /api/kickoff/season/:id/standings
app.post("/api/kickoff/season/:id/standings", (req, res) => {
    let sql = `INSERT INTO standings (team_id, season_id) VALUES (${req.body.team_id}, ${req.params.id})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM standings ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new team standing is added successfully.",
            response: results[0]
        });
    });
});

// PUT a team standing ... /api/kickoff/season/:id/standings
app.put("/api/kickoff/season/:id/standings", (req, res) => {
    let sql = `UPDATE standings SET plays=${req.body.plays}, wins=${req.body.wins}, draws=${req.body.draws}, losses=${req.body.losses}, goals_against=${req.body.goals_against}, goals_for=${req.body.goals_for}, goals_difference=${req.body.goals_difference}, points=${req.body.points}, last_five_matches='${req.body_last_five_matches}' WHERE team_id=${req.body.team_id} AND season_id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM standings WHERE team_id=${req.body.team_id} AND season_id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "Standings has been successfully updated.",
            response: results[0]
        });
    });
});

// GET all goal scores on a season ... /api/kickoff/season/:id/goals
app.get("/api/kickoff/season/:id/goals", (req, res) => {
    let sql = `SELECT * FROM goals_on_seasons WHERE season_id=${req.params.id} ORDER BY goals_scored DESC`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// POST a new goal scores on a season ... /api/kickoff/season/:id/goals
app.post("/api/kickoff/season/:id/goals", (req, res) => {
    let sql = `INSERT INTO goals_on_seasons (season_id, player_id, goals_on_scored) VALUES (${req.params.id}, ${req.body.player_id}, ${req.body.goals_on_scored})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM goals_on_seasons ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new goals on seasons is added successfully.",
            response: results[0]
        });
    });
});

// PUT a goal scores on a season ... /api/kickoff/season/:id/goals
app.put("/api/kickoff/season/:id/goals", (req, res) => {
    let sql = `UPDATE goals_on_seasons SET goals_on_scored=${req.body.goals_on_scored} WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM goals_on_seasons WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "Goals on seasons has been successfully updated.",
            response: results[0]
        });
    });
});

// GET all assists created on a season ... /api/kickoff/season/:id/assists
app.get("/api/kickoff/season/:id/assists", (req, res) => {
    let sql = `SELECT * FROM assists_on_seasons WHERE season_id=${req.params.id} ORDER BY assists_created DESC`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// POST a new assists created on a season ... /api/kickoff/season/:id/assists
app.post("/api/kickoff/season/:id/assists", (req, res) => {
    let sql = `INSERT INTO assists_on_seasons (season_id, player_id, assists_created) VALUES (${req.params.id}, ${req.body.player_id}, ${req.body.assists_created})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM assists_on_seasons ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new assists on seasons is added successfully.",
            response: results[0]
        });
    });
});

// PUT a assists created on a season ... /api/kickoff/season/:id/assists
app.put("/api/kickoff/season/:id/assists", (req, res) => {
    let sql = `UPDATE assists_on_seasons SET assists_created=${req.body.assists_created} WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM assists_on_seasons WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "Assists on seasons has been successfully updated.",
            response: results[0]
        });
    });
});

// GET all red cards obtained by players on a season ... /api/kickoff/season/:id/red-cards
app.get("/api/kickoff/season/:id/red-cards", (req, res) => {
    let sql = `SELECT * FROM red_cards_on_seasons WHERE season_id=${req.params.id} ORDER BY red_cards_obtained DESC`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// POST a red cards obtained by players on a season ... /api/kickoff/season/:id/red-cards
app.post("/api/kickoff/season/:id/red-cards", (req, res) => {
    let sql = `INSERT INTO red_cards_on_seasons (season_id, player_id, red_cards_obtained) VALUES (${req.params.id}, ${req.body.player_id}, ${req.body.red_cards_obtained})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM red_cards_on_seasons ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new red cards on seasons is added successfully.",
            response: results[0]
        });
    });
});

// PUT a red cards obtained by players on a season ... /api/kickoff/season/:id/red-cards
app.put("/api/kickoff/season/:id/red-cards", (req, res) => {
    let sql = `UPDATE red_cards_on_seasons SET red_cards_obtained=${req.body.red_cards_obtained} WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM red_cards_on_seasons WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "Red cards on seasons has been successfully updated.",
            response: results[0]
        });
    });
});

// GET all yellow cards obtained by players on a season ... /api/kickoff/season/:id/yellow-cards
app.get("/api/kickoff/season/:id/yellow-cards", (req, res) => {
    let sql = `SELECT * FROM yellow_cards_on_seasons WHERE season_id=${req.params.id} ORDER BY yellow_cards_obtained DESC`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// POST a yellow cards obtained by players on a season ... /api/kickoff/season/:id/yellow-cards
app.post("/api/kickoff/season/:id/yellow-cards", (req, res) => {
    let sql = `INSERT INTO yellow_cards_on_seasons (season_id, player_id, yellow_cards_obtained) VALUES (${req.params.id}, ${req.body.player_id}, ${req.body.yellow_cards_obtained})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM yellow_cards_on_seasons ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new yellow cards on seasons is added successfully.",
            response: results[0]
        });
    });
});

// PUT a yellow cards obtained by players on a season ... /api/kickoff/season/:id/yellow-cards
app.put("/api/kickoff/season/:id/yellow-cards", (req, res) => {
    let sql = `UPDATE yellow_cards_on_seasons SET yellow_cards_obtained=${req.body.yellow_cards_obtained} WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM yellow_cards_on_seasons WHERE season_id=${req.params.id} AND player_id=${req.body.player_id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "Yellow cards on seasons has been successfully updated.",
            response: results[0]
        });
    });
});

// GET all teams ... /api/kickoff/teams
app.get('/api/kickoff/teams', (req, res) => {
    const sql = `SELECT * FROM teams`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// GET a specific team ... /api/kickoff/team/:id
app.get('/api/kickoff/team/:id', (req, res) => {
    const sql = `SELECT * FROM teams WHERE id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results[0]
        });
    });
});

// POST a new team ... /api/kickoff/teams
app.post('/api/kickoff/teams', (req, res) => {
    let sql = `INSERT INTO teams (name, nickname, logo_url_fr_internet, logo_url_fr_server, description, address, location, phone, website, founded_year, stadium, ceo) `;
    sql += `VALUES ('${req.body.name}', '${req.body.nickname}', '${req.body.logo_url_fr_internet}', '${req.body.logo_url_fr_server}', '${req.body.description}', '${req.body.address}', '${req.body.location}', '${req.body.phone}', '${req.body.website}', '${req.body.founded_year}', '${req.body.stadium}', '${req.body.ceo}')`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM teams ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: 'A new team is added successfully.',
            response: results[0]
        });
    });
});

// GET a specific player ... /api/kickoff/player/:id
app.get('/api/kickoff/player/:id', (req, res) => {
    let sql = `SELECT * FROM players WHERE id = ${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results[0]
        });
    });
});

// POST a new player ... /api/kickoff/players
app.post('/api/kickoff/players', (req, res) => {
    const getAge = dateString => {
        const diff = Date.now() - new Date(dateString).getTime();
        return new Date(diff).getUTCFullYear() - 1970;
    };
    let sql = `INSERT INTO players (name, image_url_fr_internet, image_url_fr_server, date_of_birth, place_of_birth, nationality, age, height, prefer_position_id, position_id, team_id, shirt_number, rating)`;
    sql += `VALUES ('${req.body.name}', '${req.body.image_url_fr_internet}', '${req.body.image_url_fr_server}', '${req.body.date_of_birth}', '${req.body.place_of_birth}', '${req.body.nationality}', ${getAge(req.body.date_of_birth)}, ${req.body.height}, ${req.body.prefer_position_id}, ${req.body.position_id}, ${req.body.team_id}, `;
    sql += req.body.shirt_number === null ? `${req.body.shirt_number}, ${req.body.rating})` : `'${req.body.shirt_number}', ${req.body.rating})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM players ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: 'A new player is added successfully.',
            response: results[0]
        });
    });
});

// GET a specific coach ... /api/kickoff/coach/:id
app.get('/api/kickoff/coach/:id', (req, res) => {
    let sql = `SELECT * FROM coaches WHERE id = ${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results[0]
        });
    });
});

// POST a new coach ... /api/kickoff/coaches
app.post('/api/kickoff/coaches', (req, res) => {
    const getAge = dateString => {
        const diff = Date.now() - new Date(dateString).getTime();
        return new Date(diff).getUTCFullYear() - 1970;
    };
    let sql = `INSERT INTO coaches (name, fullname, image_url_fr_internet, image_url_fr_server, date_of_birth, place_of_birth, nationality, age, appointed, contract_until, team_id) `;
    sql += `VALUES ('${req.body.name}', '${req.body.fullname}', '${req.body.image_url_fr_internet}', '${req.body.image_url_fr_server}', '${req.body.date_of_birth}', '${req.body.place_of_birth}', '${req.body.nationality}', ${getAge(req.body.date_of_birth)}, '${req.body.appointed}', '${req.body.contract_until}', ${req.body.team_id})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM coaches ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: 'A new coach is added successfully.',
            response: results[0]
        });
    });
});

// GET a specific match ... /api/kickoff/match/:id
app.get("/api/kickoff/match/:id", (req, res) => {
    let sql = `SELECT * FROM matches WHERE id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results[0]
        });
    });
});

// GET all matches on specific season competition ... /api/kickoff/season/:id/matches
app.get("/api/kickoff/season/:id/matches", (req, res) => {
    let sql = `SELECT * FROM matches WHERE season_id=${req.params.id} ORDER BY time_date`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// POST a new match ... /api/kickoff/matches
app.post("/api/kickoff/matches", (req, res) => {
    let sql = `INSERT INTO matches (season_id, time_date, status, matchday, home_team_id, away_team_id, score_home_team_half_time, score_away_team_half_time, score_home_team_full_time, score_away_team_full_time, stadium) `;
    sql += `VALUES (${req.body.season_id}, '${req.body.time_date}', '${req.body.status}', ${req.body.matchday}, ${req.body.home_team_id}, ${req.body.away_team_id}, ${req.body.score_home_team_half_time}, ${req.body.score_away_team_half_time}, ${req.body.score_home_team_full_time}, ${req.body.score_away_team_full_time}, '${req.body.stadium}')`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM matches ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new match is added successfully.",
            response: results[0],
        });
    });
});

// GET a specific match stats ... /api/kickoff/match/:id/stats
app.get("/api/kickoff/match/:id/stats", (req, res) => {
    let sql = `SELECT * FROM match_stats WHERE match_id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results[0]
        });
    });
});

// POST a new match stats ... /api/kickoff/match/:id/stats
app.post("/api/kickoff/match/:id/stats", (req, res) => {
    let sql = `INSERT INTO match_stats (match_id, home_team_shots, away_team_shots, home_team_shots_on_target, away_team_shots_on_target, home_team_possession, away_team_possession, home_team_passes, away_team_passes, home_team_pass_accuracy, away_team_pass_accuracy, home_team_fouls, away_team_fouls, home_team_yellow_cards, away_team_yellow_cards, home_team_red_cards, away_team_red_cards, home_team_offsides, away_team_offsides, home_team_corners, away_team_corners) `;
    sql += `VALUES (${req.params.id}, ${req.body.home_team_shots}, ${req.body.away_team_shots}, ${req.body.home_team_shots_on_target}, ${req.body.away_team_shots_on_target}, ${req.body.home_team_possession}, ${req.body.away_team_possession}, ${req.body.home_team_passes}, ${req.body.away_team_passes}, ${req.body.home_team_pass_accuracy}, ${req.body.away_team_pass_accuracy}, ${req.body.home_team_fouls}, ${req.body.away_team_fouls}, ${req.body.home_team_yellow_cards}, ${req.body.away_team_yellow_cards}, ${req.body.home_team_red_cards}, ${req.body.away_team_red_cards}, ${req.body.home_team_offsides}, ${req.body.away_team_offsides}, ${req.body.home_team_corners}, ${req.body.away_team_corners})`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM match_stats ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new match stats is added successfully.",
            response: results[0]
        });
    });
});

// GET all goals scored in specific match ... /api/kickoff/match/:id/goals
app.get("/api/kickoff/match/:id/goals", (req, res) => {
    let sql = `SELECT * FROM goals_on_matches WHERE match_id=${req.params.id} ORDER BY minutes`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// POST a new goals on matches ... /api/kickoff/match/:id/goals
app.post("/api/kickoff/match/:id/goals", (req, res) => {
    let sql = `INSERT INTO goals_on_matches (match_id, player_id, minutes, status_team, status_goals) `;
    sql += `VALUES (${req.params.id}, ${req.body.player_id}, ${req.body.minutes}, '${req.body.status_team}', '${req.body.status_goals}')`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM goals_on_matches ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new goals on matches is added successfully.",
            response: results[0]
        });
    });
});

// GET all red cards obtained in specific match ... /api/kickoff/match/:id/red-cards
app.get("/api/kickoff/match/:id/red-cards", (req, res) => {
    let sql = `SELECT * FROM red_cards_on_matches WHERE match_id=${req.params.id}`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            response: results
        });
    });
});

// POST a new red cards on matches ... /api/kickoff/match/:id/red-cards
app.post("/api/kickoff/match/:id/red-cards", (req, res) => {
    let sql = `INSERT INTO red_cards_on_matches (match_id, player_id, status_team) `;
    sql += `VALUES (${req.params.id}, ${req.body.player_id}, '${req.body.status_team}')`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
    });
    sql = `SELECT * FROM red_cards_on_matches ORDER BY id DESC LIMIT 1`;
    conn.query(sql, (err, results) => {
        if (err) throw err;
        else res.json({
            status: 200,
            err: null,
            message: "A new red cards on matches is added successfully.",
            response: results[0]
        });
    });
});

// Listening on port...
app.listen(port, (err) => {
    if (err) throw err;
    else console.log(`Server listening on port ${port}...`);
});