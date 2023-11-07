const User = require('../models/User');
const constants = require('../config/constants');

exports.getAllUsers = async (req, res) => {
    try {
        const users = await User.find();
        res.status(200).json(users);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.getUserById = async (req, res) => {
    try {
        const user = await User.findById(req.params.id);
        if (!user) {
            return res.status(404).json({ message: constants.userNotFoundMsg });
        }
        res.status(200).json(user);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.updateUser = async (req, res) => {
    try {
        const user = await User.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!user) {
            return res.status(404).json({ message: constants.userNotFoundMsg });
        }
        res.status(200).json(user);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.deleteUser = async (req, res) => {
    try {
        const user = await User.findByIdAndRemove(req.params.id);
        if (!user) {
            return res.status(404).json({ message: constants.userNotFoundMsg });
        }
        res.status(200).json({ message: constants.userDeletedMsg });
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};