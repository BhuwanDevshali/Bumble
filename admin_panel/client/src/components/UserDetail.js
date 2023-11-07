import React, { useState, useEffect } from 'react';
import apiService from '../services/apiService';
import { USER_API } from '../utils/constants';

const UserDetail = ({ match }) => {
  const [user, setUser] = useState(null);

  useEffect(() => {
    const fetchUser = async () => {
      const response = await apiService.get(`${USER_API}/${match.params.id}`);
      setUser(response.data);
    };

    fetchUser();
  }, [match.params.id]);

  return (
    <div>
      {user && (
        <div>
          <h2>{user.name}</h2>
          <p>Email: {user.email}</p>
          <p>Age: {user.age}</p>
          <p>Location: {user.location}</p>
          <p>Interests: {user.interests.join(', ')}</p>
        </div>
      )}
    </div>
  );
};

export default UserDetail;