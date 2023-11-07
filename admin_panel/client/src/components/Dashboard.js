import React, { useEffect, useState } from 'react';
import apiService from '../services/apiService';
import UserList from './UserList';
import ChatList from './ChatList';
import MatchList from './MatchList';

const Dashboard = () => {
  const [users, setUsers] = useState([]);
  const [chats, setChats] = useState([]);
  const [matches, setMatches] = useState([]);

  useEffect(() => {
    fetchUsers();
    fetchChats();
    fetchMatches();
  }, []);

  const fetchUsers = async () => {
    const response = await apiService.getUsers();
    setUsers(response.data);
  };

  const fetchChats = async () => {
    const response = await apiService.getChats();
    setChats(response.data);
  };

  const fetchMatches = async () => {
    const response = await apiService.getMatches();
    setMatches(response.data);
  };

  return (
    <div>
      <h1>Admin Dashboard</h1>
      <UserList users={users} />
      <ChatList chats={chats} />
      <MatchList matches={matches} />
    </div>
  );
};

export default Dashboard;