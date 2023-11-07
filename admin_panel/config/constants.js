const DB_CONNECTION = 'mongodb://localhost:27017/bumbleClone';
const JWT_SECRET = 'your-secret-key';
const PORT = process.env.PORT || 5000;

module.exports = {
    DB_CONNECTION,
    JWT_SECRET,
    PORT
};