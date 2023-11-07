const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const userRoutes = require('./routes/userRoutes');
const chatRoutes = require('./routes/chatRoutes');
const matchRoutes = require('./routes/matchRoutes');
const auth = require('./middleware/auth');
const db = require('./config/db');
const constants = require('./config/constants');

const app = express();

// Connect to MongoDB
mongoose.connect(db.DB_CONNECTION, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('MongoDB Connected...'))
  .catch(err => console.log(err));

// Middleware
app.use(express.json());
app.use(cors());

// Routes
app.use('/api/users', auth, userRoutes);
app.use('/api/chats', auth, chatRoutes);
app.use('/api/matches', auth, matchRoutes);

app.listen(constants.PORT, () => console.log(`Server running on port ${constants.PORT}`));