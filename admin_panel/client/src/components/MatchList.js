import React, { useEffect, useState } from 'react';
import apiService from '../services/apiService';
import MatchDetail from './MatchDetail';

const MatchList = () => {
  const [matches, setMatches] = useState([]);

  useEffect(() => {
    fetchMatches();
  }, []);

  const fetchMatches = async () => {
    const response = await apiService.fetchMatches();
    setMatches(response.data);
  };

  return (
    <div>
      <h2>Match List</h2>
      {matches.map((match) => (
        <MatchDetail key={match._id} match={match} />
      ))}
    </div>
  );
};

export default MatchList;