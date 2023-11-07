const Chat = require('../models/Chat');
const constants = require('../config/constants');

exports.getAllChats = async (req, res) => {
    try {
        const chats = await Chat.find();
        res.status(200).json(chats);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.getChatById = async (req, res) => {
    try {
        const chat = await Chat.findById(req.params.id);
        if (!chat) {
            return res.status(404).json({ message: constants.chatNotFoundMsg });
        }
        res.status(200).json(chat);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.createChat = async (req, res) => {
    try {
        const chat = new Chat(req.body);
        const savedChat = await chat.save();
        res.status(201).json(savedChat);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.updateChat = async (req, res) => {
    try {
        const updatedChat = await Chat.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedChat) {
            return res.status(404).json({ message: constants.chatNotFoundMsg });
        }
        res.status(200).json(updatedChat);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};

exports.deleteChat = async (req, res) => {
    try {
        const deletedChat = await Chat.findByIdAndDelete(req.params.id);
        if (!deletedChat) {
            return res.status(404).json({ message: constants.chatNotFoundMsg });
        }
        res.status(200).json(deletedChat);
    } catch (error) {
        res.status(500).json({ message: constants.serverErrorMsg });
    }
};