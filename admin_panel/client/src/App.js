import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Dashboard from './components/Dashboard';
import UserList from './components/UserList';
import ChatList from './components/ChatList';
import MatchList from './components/MatchList';
import UserDetail from './components/UserDetail';
import ChatDetail from './components/ChatDetail';
import MatchDetail from './components/MatchDetail';

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/" exact component={Dashboard} />
        <Route path="/users" exact component={UserList} />
        <Route path="/chats" exact component={ChatList} />
        <Route path="/matches" exact component={MatchList} />
        <Route path="/users/:id" component={UserDetail} />
        <Route path="/chats/:id" component={ChatDetail} />
        <Route path="/matches/:id" component={MatchDetail} />
      </Switch>
    </Router>
  );
}

export default App;