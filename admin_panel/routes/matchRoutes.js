const express = require('express');
const matchController = require('../controllers/matchController');
const auth = require('../middleware/auth');

const router = express.Router();

router.use(auth);

router.route('/')
    .get(matchController.getAllMatches)
    .post(matchController.createMatch);

router.route('/:id')
    .get(matchController.getMatch)
    .patch(matchController.updateMatch)
    .delete(matchController.deleteMatch);

module.exports = router;