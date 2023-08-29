let express = require('express');
let app = express();
let bodyParser = require('body-parser');
let mysql = require('mysql');
const cors = require('cors')

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true}));


// homepage route
app.get('/', (req,res) => {
    return res.send({
        error: false,
        message: 'welcome to mysql',
        written_by: 'Bie',
        published_on: 'http://localhost:3000'
    })
})
// connection to mysql database
let dbCon = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'first_pro'
})
dbCon.connect();

// retrieve all card
app.get('/card', (req, res) =>{
    dbCon.query('SELECT * FROM card', (error, results, fields) =>{
        if(error) throw error;

        let message = ''
        if (results === undefined || results.length == 0){
            message = 'Card table is empty';
        }else{
            message = 'Successfully retrieved all card';
        }
        return res.send({ error: false, data: results, message: message})
    })
})

//select card by id
app.post('/card/byid', (req, res) => {
    const cardId = req.body.card_id; // Use req.body.card_id instead of req.params.card_id

    dbCon.query(
        'SELECT description_en, description_th FROM card WHERE card_id = ?',
        [cardId],
        (error, results, fields) => {
            if (error) {
                return res.status(500).send({ error: true, message: 'Error fetching card' });
            }

            if (results === undefined || results.length === 0) {
                return res.status(404).send({ error: true, message: 'Card not found' });
            }

            return res.status(200).send({
                error: false,
                data: results[0], // Assuming you want to send the first result only
                message: 'Successfully retrieved the card',
            });
        }
    );
});

//post user detail
app.post('/post/user', (req, res) => {
    const { email, first_name, last_name } = req.body;

    if (!email || !first_name || !last_name) {
        return res.status(400).send({ error: true, message: 'Missing required fields' });
    }

    // User doesn't exist, insert the new user data
    const insertSql = 'INSERT INTO user_info (email, first_name, last_name) VALUES (?, ?, ?)';
    const insertValues = [email, first_name, last_name];

    dbCon.query(insertSql, insertValues, (insertError, insertResults, insertFields) => {
        if (insertError) {
            console.error('Error inserting user:', insertError);
            return res.status(500).send({ error: true, message: 'Error inserting user' });
        }

        return res.status(201).send({ error: false, message: 'User inserted successfully' });
    });
});


//check email user if have not post
app.get('/check-user', (req, res) => {
    const email = req.query.email;

    if (!email) {
        return res.status(400).send({ error: true, message: 'Missing email parameter' });
    }

    // Check if the user already exists in the database
    const checkSql = 'SELECT * FROM user_info WHERE email = ?';
    const checkValues = [email];

    dbCon.query(checkSql, checkValues, (checkError, checkResults, checkFields) => {
        if (checkError) {
            console.error('Error checking user:', checkError);
            return res.status(500).send({ error: true, message: 'Error checking user' });
        }

        if (checkResults.length > 0) {
            // User with the provided email already exists
            return res.status(200).send({ exists: true, message: 'User with this email already exists' });
        }

        // User doesn't exist
        return res.status(200).send({ exists: false, message: 'User with this email does not exist' });
    });
});





//get category description
app.post('/get/description', (req, res) => {
    const { categoryId } = req.body; // Use req.body instead of req.params for POST requests
    if (!categoryId) {
        return res.status(400).send({ error: true, message: 'Missing required fields' });
    }

    const sql = 'SELECT description_th, description_en FROM personality WHERE personality_id = ?';
    const values = [categoryId];

    dbCon.query(sql, values, (error, results, fields) => {
        if (error) {
            console.error('Error fetching category description:', error);
            return res.status(500).send({ error: true, message: 'Error fetching category description' });
        }

        if (results.length === 0) {
            return res.status(404).send({ error: true, message: 'Category not found' });
        }

        const description_th = results[0].description_th;
        const description_en = results[0].description_en;

        return res.status(200).send({ error: false, description_th, description_en });
    });
});

//get id user
app.post('/get/id_user', (req, res) => {
    const { email } = req.body;

    if (!email) {
        return res.status(400).send({ error: true, message: 'Missing required fields' });
    }

    const sql = 'SELECT user_id FROM user_info WHERE email = ?';
    const values = [email];

    dbCon.query(sql, values, (error, results, fields) => {
        if (error) {
            console.error('Error fetching id user:', error);
            return res.status(500).send({ error: true, message: 'Error fetching id user' });
        }

        if (results.length === 0) {
            return res.status(404).send({ error: true, message: 'User not found' });
        }

        const user_id = results[0].user_id; // Corrected line

        return res.status(200).send({ error: false, user_id });
    });
});

app.delete('/delete/history', (req, res) => {
    const { play_id } = req.body;

    if (!play_id) {
        return res.status(400).send({ error: true, message: 'Missing play_id in request body' });
    }

    const sql = 'DELETE FROM play_log WHERE play_id = ?';
    const values = [play_id];

    dbCon.query(sql, values, (error, results, fields) => {
        if (error) {
            console.error('Error deleting play log:', error);
            return res.status(500).send({ error: true, message: 'Error deleting play log' });
        }

        if (results.affectedRows === 0) {
            return res.status(404).send({ error: true, message: 'Play log not found' });
        }

        return res.status(200).send({ error: false, message: 'Play log deleted successfully' });
    });
});



//post result 
app.post('/post/result', (req, res) => {
    const { user_id, personality_id, mostAnimal, leastAnimal } = req.body;

    if ( !user_id || !personality_id || !mostAnimal || !leastAnimal) {
        return res.status(400).send({ error: true, message: 'Missing required fields' });
    }

    // User doesn't exist, insert the new user data
    const insertSql = 'INSERT INTO play_log ( user_id, personality_id, like_selected, notlike_selected) VALUES (?, ?, ?, ?)';
    const insertValues = [ user_id, personality_id, mostAnimal, leastAnimal ];

    dbCon.query(insertSql, insertValues, (insertError, insertResults, insertFields) => {
        if (insertError) {
            console.error('Error inserting user:', insertError);
            return res.status(500).send({ error: true, message: 'Error inserting user' });
        }

        return res.status(201).send({ error: false, message: 'User inserted successfully' });
    });
});

//get id user
app.post('/get/history', (req, res) => {
    const { user_id } = req.body;

    const sql = 'SELECT * FROM play_log WHERE user_id = ?';
    const values = [user_id]; 

    dbCon.query(sql, values, (error, results, fields) => {
        if (error) {
            console.error('Error fetching play history:', error);
            return res.status(500).send({ error: true, message: 'Error fetching play history' });
        }

        if (results.length === 0) {
            return res.status(404).send({ error: true, message: 'Play history not found for this user' });
        }

        const formattedPlayHistory = results.map(play => {
            const playDate = new Date(play.play_date);
            const playTimeParts = play.play_time.split(':');

            const playTime = new Date(playDate);
            playTime.setHours(playTimeParts[0]);
            playTime.setMinutes(playTimeParts[1]);

            return {
                ...play,
                play_date: playDate.toLocaleDateString('en-US', {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit'
                }),
                play_time: playTime.toLocaleTimeString('en-US', {
                    hour: '2-digit',
                    minute: '2-digit'
                })
            };
        });

        return res.status(200).send({ error: false, playHistory: formattedPlayHistory });
    });
});



app.listen(3007, () =>{
    console.log('Node app is running on port 3007')
})

module.exports = app;