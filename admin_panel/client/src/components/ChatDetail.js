import React, { useState, useEffect } from 'react';
import apiService from '../services/apiService';
import constants from '../utils/constants';

const ChatDetail = ({ match }) => {
  const [chat, setChat] = useState(null);

  useEffect(() => {
    fetchChat();
  }, []);

  const fetchChat = async () => {
    const response = await apiService.get(`${constants.API.CHAT_URL}/${match.params.id}`);
    setChat(response.data);
  };

  return (
    <div>
      {chat && (
        <div>
          <h2>Chat Detail</h2>
          <p><strong>Chat ID:</strong> {chat._id}</p>
          <p><strong>Sender:</strong> {chat.sender}</p>
          <p><strong>Receiver:</strong> {chat.receiver}</p>
          <p><strong>Message:</strong> {chat.message}</p>
          <p><strong>Timestamp:</strong> {new Date(chat.timestamp).toLocaleString()}</p>
        </div>
      )}
    </div>
  );
};

export default ChatDetail;