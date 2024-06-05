const express = require('express');
const cors = require('cors');

const app = express();

app.use(express.json());
app.use(cors());

const port = process.env.PORT || 3000;


app.get('/test', (req, res) => {
    res.send("Hello World");
});

app.get('/nombre', (req, res) => {
    res.send("Hola soy Jose Miguel Mendoza Gomez");
});

app.get('/welcome', (req, res) => {
    res.send("Hola Bienvenido soy Jose Miguel Mendoza Gomez");
});

app.get('/hola', (req, res) => {
    res.send("Hola");
});

app.listen(port, () => {
    console.log(`SERVER RUNNING IN http://localhost:${port}.`);
});