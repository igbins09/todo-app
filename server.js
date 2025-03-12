const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.static('public'));

let tasks = [];

app.get('/tasks', (req, res) => res.json(tasks));
app.post('/tasks', (req, res) => {
  const task = { id: tasks.length + 1, text: req.body.text };
  tasks.push(task);
  res.status(201).json(task);
});
app.delete('/tasks/:id', (req, res) => {
  tasks = tasks.filter(task => task.id !== parseInt(req.params.id));
  res.status(204).send();
});

app.listen(port, () => console.log(`Server running on port ${port}`));
