import axios from 'axios';
import { API_URL } from '../utils/constants';

export const getUsers = async () => {
  try {
    const response = await axios.get(`${API_URL}/users`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const getChats = async () => {
  try {
    const response = await axios.get(`${API_URL}/chats`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const getMatches = async () => {
  try {
    const response = await axios.get(`${API_URL}/matches`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const getUserDetail = async (id) => {
  try {
    const response = await axios.get(`${API_URL}/users/${id}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const getChatDetail = async (id) => {
  try {
    const response = await axios.get(`${API_URL}/chats/${id}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const getMatchDetail = async (id) => {
  try {
    const response = await axios.get(`${API_URL}/matches/${id}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};