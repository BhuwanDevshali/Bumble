import React, { useEffect, useState } from 'react';
import apiService from '../services/apiService';
import ChatDetail from './ChatDetail';

const ChatList = () => {
  const [chats, setChats] = useState([]);

  useEffect(() => {
    fetchChats();
  }, []);

  const fetchChats = async () => {
    const response = await apiService.fetchChats();
    setChats(response.data);
  };

  return (
    <div>
      <h2>Chats</h2>
      {chats.map((chat) => (
        <ChatDetail key={chat._id} chat={chat} />
      ))}
    </div>
  );
};

export default ChatList;