import React, { useEffect, useState } from 'react';
import apiService from '../services/apiService';
import UserDetail from './UserDetail';

const UserList = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    fetchUsers();
  }, []);

  const fetchUsers = async () => {
    const response = await apiService.getUsers();
    setUsers(response.data);
  };

  return (
    <div>
      <h2>User List</h2>
      {users.map(user => (
        <UserDetail key={user._id} user={user} />
      ))}
    </div>
  );
};

export default UserList;