const express = require('express')
const app = express();
const port = 3000;

app.get('/api/v1/welcome', (req, res) => {
    res.send('Welcome to the API :)');    
})

app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
})