const Match = require('../models/Match');
const constants = require('../config/constants');

exports.getAllMatches = async (req, res) => {
    try {
        const matches = await Match.find();
        res.status(200).json(matches);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.getMatchById = async (req, res) => {
    try {
        const match = await Match.findById(req.params.id);
        if (!match) {
            return res.status(404).json({ message: constants.matchNotFoundMsg });
        }
        res.status(200).json(match);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.createMatch = async (req, res) => {
    try {
        const newMatch = new Match(req.body);
        const savedMatch = await newMatch.save();
        res.status(201).json(savedMatch);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.updateMatch = async (req, res) => {
    try {
        const updatedMatch = await Match.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedMatch) {
            return res.status(404).json({ message: constants.matchNotFoundMsg });
        }
        res.status(200).json(updatedMatch);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.deleteMatch = async (req, res) => {
    try {
        const deletedMatch = await Match.findByIdAndDelete(req.params.id);
        if (!deletedMatch) {
            return res.status(404).json({ message: constants.matchNotFoundMsg });
        }
        res.status(200).json(deletedMatch);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};