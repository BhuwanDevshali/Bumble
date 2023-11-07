const express = require('express');
const router = express.Router();
const chatController = require('../controllers/chatController');
const auth = require('../middleware/auth');

router.get('/', auth, chatController.getAllChats);
router.get('/:id', auth, chatController.getChatById);
router.post('/', auth, chatController.createChat);
router.put('/:id', auth, chatController.updateChat);
router.delete('/:id', auth, chatController.deleteChat);

module.exports = router;