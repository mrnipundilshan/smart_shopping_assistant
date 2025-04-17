const db = require('../config/db');

//Register user
const RegisterUser = (req, res) => {
    const { email, is_verified } = req.body;

    if(!email){
        return res.status(400).json({message: "Email is required" });
    }

    const sql = 'INSERT INTO users (email, is_verified) VALUES (?. ?)';

    db.query(sql, [email, is_verified || false], (err, result)=>{
        if(err){
            console.error('Error inserting user:', err);
            return res.status(500).json({message: 'Database error' });
        }

        res.status(201).json({message: 'User registered successfully', userId: result.insertId });
    });
}

module.exports = { RegisterUser };