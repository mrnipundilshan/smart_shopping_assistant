const express = require('express');
const router = express.Router();
const { registerUser } = require('../controllers/userController');

//post /api/register
router.post('/register', registerUser);

module.exports = router;