import React, { useState, useEffect } from 'react';
import apiService from '../services/apiService';
import { MATCH_API } from '../utils/constants';

const MatchDetail = ({ matchId }) => {
  const [match, setMatch] = useState(null);

  useEffect(() => {
    fetchMatch();
  }, [matchId]);

  const fetchMatch = async () => {
    try {
      const response = await apiService.get(`${MATCH_API}/${matchId}`);
      setMatch(response.data);
    } catch (error) {
      console.error('Failed to fetch match:', error);
    }
  };

  return (
    <div>
      {match ? (
        <div>
          <h2>Match Detail</h2>
          <p>User 1: {match.user1}</p>
          <p>User 2: {match.user2}</p>
          <p>Matched On: {new Date(match.matchedOn).toLocaleDateString()}</p>
        </div>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
};

export default MatchDetail;