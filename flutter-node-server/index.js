const express = require('express');
const path = require('path');
const app = express();

const PORT = process.env.PORT || 3001;

// Serve static files from the Flutter web build directory
app.use(express.static(path.join(__dirname, './public/web')));

// All other routes should serve the index.html file
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, './public/web/index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
