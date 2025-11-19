console.log("Hello, BMAD agent is running! 😍💪💃");


require('dotenv').config();


const OpenAI = require('openai');


const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());


const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY
});


app.post('/agent/start', (req, res) => {
    res.send("Agent started successfully!");
});


app.post('/agent/query', async (req, res) => {
    const { query } = req.body;
    try {
        const response = await openai.chat.completions.create({
            model: "gpt-4o-mini",
            messages: [{ role: "user", content: query }]
        });
        res.json({ response: response.choices[0].message.content });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

const PORT = 3000;
app.listen(PORT, () => console.log(`Agent server running on http://localhost:${PORT}`));
